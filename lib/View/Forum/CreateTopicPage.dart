import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateTopicPage extends StatelessWidget {
  final TextEditingController topicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Create New Topic"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: topicController,
              decoration: InputDecoration(
                hintText: "Enter Topic Name",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, topicController.text);
              },
              child: Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}