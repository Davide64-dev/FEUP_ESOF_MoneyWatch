import 'package:flutter/material.dart';

import '../../Model/Post.dart';
import '../../Model/User.dart';
import 'CreatePostDialog.dart';
import 'EditPostDialog.dart';
class TopicPage extends StatefulWidget {
  final String topic;

  TopicPage({required this.topic});

  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  List<Post> posts = [Post(title: 'Post 1', content: 'Arroz e picanha', comments: [], category: ''),      Post(title: 'Post 2', content: 'FeijÃ£o preto', comments: [], category: ''),      Post(title: 'Post 3', content: 'Batatas fritas', comments: [], category: ''),    ];
  List<Post> filteredPosts = [];
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    filteredPosts = posts;
    super.initState();
  }
  void filterPosts(String query) {
    List<Post> temp = [];
    for (var p in posts) {
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
                filteredPosts = posts;
                searchController.clear();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredPosts.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(filteredPosts[index].title),
              subtitle: Text(filteredPosts[index].content),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () async {
                      Post? editedPost = await showDialog<Post>(
                        context: context,
                        builder: (BuildContext context) {
                          return EditPostDialog(post: filteredPosts[index]);
                        },
                      );
                      if (editedPost != null) {
                        if (editedPost.content.isEmpty || editedPost.title.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Delete Post"),
                                content: Text("Are you sure you want to delete this post?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        filteredPosts.removeAt(index);
                                        posts = filteredPosts;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          setState(() {
                            posts[posts.indexOf(filteredPosts[index])] = editedPost;
                            filteredPosts[filteredPosts.indexOf(filteredPosts[index])] = editedPost;
                          });
                        }
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Delete Post"),
                            content: Text("Are you sure you want to delete this post?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    filteredPosts.removeAt(index);
                                    posts = filteredPosts;
                                  });
                                  Navigator.pop(context);
                                },
                                child: Text("Delete"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
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
              posts.add(newPost);
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