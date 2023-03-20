

import 'Comment.dart';

class Post{
  String title;
  String content;
  List<Comment> comments;
  String category;
  Post(this.title, this.content, this.comments, this.category);
}