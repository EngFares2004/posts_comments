class Comment {
  final String name;
  final String body;

  Comment({
    required this.name,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> jsonData) {
    return Comment(
      name: jsonData['name'],
      body: jsonData['body'],
    );
  }
}
