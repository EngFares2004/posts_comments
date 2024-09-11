import 'dart:convert';
import 'package:http/http.dart' as http;
import '../view_models/comment.dart';
import '../view_models/post.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List<dynamic>;
        return jsonData.map((i) => Post.fromJson(i as Map<String, dynamic>)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Comment>> fetchComments(int postId) async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/$postId/comments'),
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as List<dynamic>;
        return jsonData.map((i) => Comment.fromJson(i as Map<String, dynamic>)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> addComment(int postId, String name, String comment) async {
    await Future.delayed(const Duration(seconds: 1));
    print('Comment added: $comment');
  }
}
