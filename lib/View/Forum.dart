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

class TopicPage extends StatelessWidget {
  final String topic;

  TopicPage({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
      ),
      body: Center(
        child: Text("This is the $topic topic"),
      ),
    );
  }
}

class CreateTopicPage extends StatelessWidget {
  final TextEditingController topicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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