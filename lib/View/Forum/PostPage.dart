import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/Post.dart';
import '../../Model/User.dart';

class PostPage extends StatefulWidget {
  final String title;
  User user;
  List<String> comments = [];
  Post post;

  PostPage({required this.title, required this.user, required this.post});

  @override
  _PostPageState createState() => _PostPageState();

  void getTopics() async{
    CollectionReference topics = FirebaseFirestore.instance.collection('Comments');
    QuerySnapshot snapshot1 = await topics.get();
    getTopicsWithSnapshot(snapshot1);
  }

  void getTopicsWithSnapshot(QuerySnapshot value){
    value.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String topic = data["name"];
      comments.add(topic);
    });
  }
}

class _PostPageState extends State<PostPage> {


  TextEditingController searchController = TextEditingController();

  List<String> filteredTopics = [];

  bool isSearching = false;

  late Timer _everySecond;

  void filterTopics(String query) {
    List<String> temp = [];
    widget.comments.forEach((topic) {
      if (topic.toLowerCase().contains(query.toLowerCase())) {
        temp.add(topic);
      }
    });
    setState(() {
      filteredTopics = temp;
    });
  }

  @override
  void initState() {
    filteredTopics = widget.comments;
    super.initState();

    var _now = DateTime.now().second.toString();

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: !isSearching
            ? Text(widget.title)
            : TextField(
          onChanged: (value) {
            filterTopics(value);
          },
          controller: searchController,
          decoration: InputDecoration(
            hintText: "Search...",
            icon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              isSearching ? Icons.cancel : Icons.search,
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                filteredTopics = widget.comments;
                searchController.clear();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredTopics.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.all(24.0),
              margin: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Color(0xADD8E6FF),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Stack(
                  children: [
                    Align(
                      child: Text(
                        filteredTopics[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          );
        },
      ),
    );
  }
}
