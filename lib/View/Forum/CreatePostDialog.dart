import 'package:flutter/material.dart';

import '../../Model/Post.dart';
import '../../Model/User.dart';

class CreatePostDialog extends StatelessWidget {
  final String topic;

  CreatePostDialog({required this.topic});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Create New Post"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: "Enter Post Title",
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: contentController,
            decoration: InputDecoration(
              hintText: "Enter Post Content",
            ),
            maxLines: null,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            String title = titleController.text;
            String content = contentController.text;
            Post post = Post(title: '', content: '', comments: [], category: '');
            Navigator.pop(context, post);
          },
          child: Text("Create"),
        ),
      ],
    );
  }
}