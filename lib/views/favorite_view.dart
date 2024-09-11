import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart'; // Import the share_plus package
import '../view_models/posts_list_view_model.dart';
import 'comments_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostsListViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.favoritePosts.isEmpty) {
          return const Center(child: Text(
            'No favorite posts.',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ));
        } else {
          return ListView.builder(
            itemCount: viewModel.favoritePosts.length,
            itemBuilder: (context, index) {
              final post = viewModel.favoritePosts[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4, bottom: 8),
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        post.body,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              viewModel.toggleLike(post.id);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.comment, color: Colors.grey),
                            onPressed: () async {
                              await viewModel.fetchComments(post.id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CommentsView(postId: post.id),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.share, color: Colors.grey),
                            onPressed: () {
                              Share.share('Check out this post: ${post.title}\n${post.body}');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
