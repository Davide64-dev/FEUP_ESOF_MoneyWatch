import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  final String title;

  ForumPage({required this.title});

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  List<String> topics = ['Topic 1', 'Topic 2', 'Topic 3'];
  TextEditingController searchController = TextEditingController();

  List<String> filteredTopics = [];

  bool isSearching = false;

  void filterTopics(String query) {
    List<String> temp = [];
    topics.forEach((topic) {
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
    filteredTopics = topics;
    super.initState();
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
                filteredTopics = topics;
                searchController.clear();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredTopics.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(filteredTopics[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicPage(topic: filteredTopics[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTopicPage(),
            ),
          );
        },
        tooltip: 'Create New Post',
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
class Post {
  final String title;
  final String content;

  Post({required this.title, required this.content});
}

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
            Post post = Post(title: title, content: content);
            Navigator.pop(context, post);
          },
          child: Text("Create"),
        ),
      ],
    );
  }
}
class TopicPage extends StatefulWidget {
  final String topic;

  TopicPage({required this.topic});

  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  List<Post> posts = [Post(title: 'Post 1', content: 'Arroz e picanha'),      Post(title: 'Post 2', content: 'Feijão preto'),      Post(title: 'Post 3', content: 'Batatas fritas'),    ];
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

