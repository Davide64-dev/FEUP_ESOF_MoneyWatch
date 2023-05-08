import 'package:MoneyWatch/Model/Comment.dart';

class Post{
  String title;
  String content;
  List<Comment> comments;
  String category;
  Post({required this.title,required this.content,required this.comments,required this.category});
}