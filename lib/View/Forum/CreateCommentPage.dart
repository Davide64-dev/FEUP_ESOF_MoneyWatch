import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/Post.dart';
import '../../Model/User.dart';

class CreateCommentPage extends StatelessWidget {
  final Post post;
  CreateCommentPage({required this.post});

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
                post.addCommenttoDatabase(comment);
                Navigator.pop(context);
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}