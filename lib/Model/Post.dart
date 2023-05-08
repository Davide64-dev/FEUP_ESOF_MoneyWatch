import 'package:MoneyWatch/Model/Comment.dart';

import 'User.dart';

class Post{
  String ID;
  String title;
  String content;
  List<Comment> comments;
  String category;
  String user;
  Post({required this.ID, required this.title,required this.content,required this.comments,required this.category, required this.user});
}