import 'package:flutter/material.dart';
class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum'),
      ),
      body: Container(
        child: Text('Welcome to the MoneyWatch Forum!'),
      ),
    );
  }
}