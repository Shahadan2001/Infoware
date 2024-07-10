class BookResponse {
  final String title;
  final String image;
  final String url;
  final String subtitle;
  final String authors;
  const BookResponse(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.authors,
      required this.url});
  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
      authors: json['authors'],
      title: json['title'],
      subtitle: json['subtitle'],
      image: json['image'],
      url: json['url']);
}
