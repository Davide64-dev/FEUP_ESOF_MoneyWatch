import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/Post.dart';

class EditPostDialog extends StatefulWidget {
  final Post post;

  EditPostDialog({required this.post});

  @override
  _EditPostDialogState createState() => _EditPostDialogState();
}

class _EditPostDialogState extends State<EditPostDialog> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.post.title);
    contentController = TextEditingController(text: widget.post.content);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit Post"),
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
            Post editedPost = Post(title: title, content: content, comments: [], category: '');
            Navigator.pop(context, editedPost);
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}