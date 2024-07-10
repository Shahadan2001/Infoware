import 'dart:convert';
import 'dart:developer';

import 'package:api_repository/api_repository.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client _httpClient;
  ApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();
  final String baseUrl = 'www.dbooks.org';
  Future<List<BookResponse>> getBookDetails() async {
    try {
      var getBookDetailsUri = Uri.https(baseUrl, 'api/recent');
      var response = await _httpClient.get(getBookDetailsUri);
      print(response.body);
      if (response.statusCode == 200) {
        List<BookResponse> result = [];
        for (var book in jsonDecode(response.body)['books']) {
          result.add(BookResponse.fromJson(book));
        }
        return result;
      } else {
        return [];
      }
    } catch (e, stackTrace) {
      log('stackTrace:$stackTrace');
      return [];
    }
  }
}
