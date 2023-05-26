import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Model/Comment.dart';
import '../../Model/Post.dart';
import '../../Model/User.dart';

class CreateCommentPage extends StatelessWidget {
  User user;
  final Post post;
  List<Comment> comments;
  CreateCommentPage({required this.post, required this.user, required this.comments});

  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Create New Comment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: "Enter Text",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String comment = commentController.text;
                if (post.ID != "0") {
                  String id = post.addCommenttoDatabase(comment, user.username);
                  Comment comment1 = Comment(comment, user.username, id);
                  comments.add(comment1);
                  Navigator.pop(context);
                }
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}