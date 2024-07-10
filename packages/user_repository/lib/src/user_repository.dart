import 'package:api_repository/api_repository.dart';

class UserRepository {
  final ApiClient apiClient;
  const UserRepository(this.apiClient);

  Future<List<BookResponse>> getBookDetails() async {
    return await apiClient.getBookDetails();
  }
}
