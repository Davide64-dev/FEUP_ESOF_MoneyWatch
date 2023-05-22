import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Model/Post.dart';
import '../../Model/User.dart';
import 'CreatePostDialog.dart';
import 'EditPostDialog.dart';
import 'PostPage.dart';
class TopicPage extends StatefulWidget {
  final String topic;
  User user;
  List<Post> posts = [];


  TopicPage({required this.topic, required this.user});

  @override
  _TopicPageState createState() => _TopicPageState();

  void getPosts() async{
    CollectionReference posts = FirebaseFirestore.instance.collection('Posts');
    QuerySnapshot snapshot1 = await posts.where('category', isEqualTo: topic).get();
    getPostsWithSnapshot(snapshot1);
  }

  void getPostsWithSnapshot(QuerySnapshot value){
    value.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String id = doc.id;
      String topic = data["category"];
      String content = data["content"];
      String title = data["title"];
      String user = data["user"];
      Post post = Post(ID: id, title: title, content: content, comments: [], category: topic, user: user);
      posts.add(post);
    });
  }
}

class _TopicPageState extends State<TopicPage> {
  List<Post> filteredPosts = [];
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  late Timer _everySecond;


  @override
  void initState() {
    filteredPosts = widget.posts;
    super.initState();

    var _now = DateTime.now().second.toString();

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
      });
    });
  }
  void filterPosts(String query) {
    List<Post> temp = [];
    for (var p in widget.posts) {
      if (p.title.toLowerCase().contains(query.toLowerCase()) || p.content.toLowerCase().contains(query.toLowerCase())) {
        temp.add(p);
      }
    }
    setState(() {
      filteredPosts = temp;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: !isSearching
            ? Text(widget.topic)
            : TextField(
          onChanged: (value) {
            filterPosts(value);
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
                filteredPosts = widget.posts;
                searchController.clear();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(

            onTap: () {
              var postPage = PostPage(post: filteredPosts[index], user: widget.user, title: 'Post');
              postPage.getPosts();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => postPage,
                ),
              );
            },

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
                        filteredPosts[index].title,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Post? newPost = await showDialog<Post>(
            context: context,
            builder: (BuildContext context) {
              return CreatePostDialog(topic: widget.topic,);
            },
          );
          if (newPost != null) {
            setState(() {
              widget.posts.add(newPost);
            });
          }
        },
        tooltip: 'Create New Post',
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}