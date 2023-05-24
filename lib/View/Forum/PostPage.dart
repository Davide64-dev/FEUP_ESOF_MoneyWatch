import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Model/Comment.dart';
import '../../Model/Post.dart';
import '../../Model/User.dart';
import 'CreateCommentPage.dart';

class PostPage extends StatefulWidget {
  final String title;
  User user;
  List<Comment> comments = [];
  Post post;

  PostPage({required this.title, required this.user, required this.post});

  @override
  _PostPageState createState() => _PostPageState();

  void getPosts() async{
    CollectionReference comments1 = FirebaseFirestore.instance.collection('Comments');
    QuerySnapshot snapshot1 = await comments1.where('post', isEqualTo: post.ID).get();
    print(post.ID);
    getPostsWithSnapshot(snapshot1);
  }

  void getPostsWithSnapshot(QuerySnapshot value){
    value.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String id = doc.id;
      String content = data["content"];
      String user = data["user"];
      Comment post = Comment(content, user, id);
      comments.add(post);
    });
  }
}

class _PostPageState extends State<PostPage> {


  TextEditingController searchController = TextEditingController();

  List<Comment> filteredComments = [];

  bool isSearching = false;

  late Timer _everySecond;

  @override
  void initState() {
    filteredComments = widget.comments;
    super.initState();

    var _now = DateTime.now().second.toString();

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
      });
    });
  }

  void filterTopics(String query) {
    List<Comment> temp = [];
    widget.comments.forEach((topic) {
      if (topic.content.toLowerCase().contains(query.toLowerCase())) {
        temp.add(topic);
      }
    });
    setState(() {
      filteredComments = temp;
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
                filteredComments = widget.comments;
                searchController.clear();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredComments.length + 2, // Add 2 for the title and post content
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            // First item is the post title
            return Container(
              padding: EdgeInsets.all(24.0),
              margin: EdgeInsets.all(18),
              decoration: BoxDecoration(
              ),
              child: Align(
                child: Text(
                  widget.post.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            );
          } else if (index == 1) {
            // Second item is the post content
            return Container(
              padding: EdgeInsets.all(60.0),
              margin: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Color(0xFFFFFF),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Align(
                child: Text(
                  widget.post.content,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          } else {
            // Remaining items are the comments
            int commentIndex = index - 2; // Adjust the index to account for the title and post content
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.all(24.0),
                margin: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xADD8E6FF),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      filteredComments[commentIndex].user,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      filteredComments[commentIndex].content,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );

          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Post? newPost = await showDialog<Post>(
            context: context,
            builder: (BuildContext context) {
              return CreateCommentPage(post: widget.post);
            },
          );
        },
        tooltip: 'Create New Post',
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }


}
