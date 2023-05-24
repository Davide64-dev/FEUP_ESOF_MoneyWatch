import 'package:MoneyWatch/Model/Comment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'User.dart';

class Post{
  String ID;
  String title;
  String content;
  List<Comment> comments;
  String category;
  String user;
  Post({required this.ID, required this.title,required this.content,required this.comments,required this.category, required this.user});

  void addCommenttoDatabase(String content){
    FirebaseFirestore.instance.collection('Comments').add({
      'content': content,
      'post': this.ID,
      'user': this.user,
    });
  }
}