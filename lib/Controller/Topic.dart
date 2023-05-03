import 'package:cloud_firestore/cloud_firestore.dart';

class Topics{

  List<String> topics = [];

  factory Topics.fromFirestore(DocumentSnapshot value){
    Map<String, dynamic> data = value.data() as Map<String, dynamic>;

    return null;
  }


}