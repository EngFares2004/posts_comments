class Post {
  final int id;
  final String title;
  final String body;
  bool isLiked;

  Post({
    required this.id,
    required this.title,
    required this.body,
    this.isLiked = false,
  });

  factory Post.fromJson(Map<String, dynamic> jsonData) {
    return Post(
      id: jsonData['id'],
      title: jsonData['title'],
      body: jsonData['body'],
    );
  }
}
