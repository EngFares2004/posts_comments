import 'package:final_project/view_models/comment.dart';
import 'package:final_project/view_models/post.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';

class PostsListViewModel extends ChangeNotifier {
  List<Post> _postsList = [];
  final List<Post> _favoritePosts = [];
  bool _isLoading = false;
  List<Comment> _commentsList = [];

  List<Post> get postsList => _postsList;
  List<Post> get favoritePosts => _favoritePosts;
  bool get isLoading => _isLoading;
  List<Comment> get commentsList => _commentsList;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _postsList = await ApiService().fetchPosts();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchComments(int postId) async {
    try {
      _commentsList = await ApiService().fetchComments(postId);
      notifyListeners();
    } catch (e) {
      _commentsList = [];
    }
  }

  Future<void> addComment(int postId, String name, String comment) async {
    await ApiService().addComment(postId, name, comment);
    _commentsList.add(Comment(name: name, body: comment));
    notifyListeners();
  }

  void toggleLike(int postId) {
    final post = _postsList.firstWhere((post) => post.id == postId);
    post.isLiked = !post.isLiked;
    if (post.isLiked) {
      _favoritePosts.add(post);
    } else {
      _favoritePosts.removeWhere((favPost) => favPost.id == postId);
    }
    notifyListeners();
  }
}
