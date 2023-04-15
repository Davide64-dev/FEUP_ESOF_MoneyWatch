import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  final String title;

  ForumPage({required this.title});

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Adicione aqui a lista de tópicos e respostas do fórum
          // Pode usar widgets como ListView, ListTile, etc.
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create New Post',
        child: Icon(Icons.add),
      ),
    );
  }
}