import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/posts_list_view_model.dart';

class CommentsView extends StatelessWidget {
  final int postId;
  final TextEditingController _commentController = TextEditingController();

  CommentsView({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Container(
         padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
           color: Colors.grey[900],
          borderRadius: BorderRadius.circular(15)
    ),
          child: const Text('Comments',style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold

          ),))),
      body: Consumer<PostsListViewModel>(
        builder: (context, viewModel, child) {
          final comments = viewModel.commentsList;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return ListTile(
                      title: Text(comment.name,style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold

                      ),),
                      subtitle: Container(
                        margin: const EdgeInsets.only(left: 20),
                        padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text(comment.body,style:const TextStyle(
                              fontSize: 14,
                              color: Colors.white,


                          ), )),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(15)
                ),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _commentController,
                        decoration: const InputDecoration(
                          labelText: 'Add a comment',
                          border: OutlineInputBorder(),
                          fillColor: Colors.blue,

                        ),
                        style:const TextStyle(
                            fontSize: 16,
                            color: Colors.white,


                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send,color: Colors.blue,),
                      onPressed: () async {
                        if (_commentController.text.isNotEmpty) {

                          await viewModel.addComment(postId, "you", _commentController.text);
                          _commentController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
