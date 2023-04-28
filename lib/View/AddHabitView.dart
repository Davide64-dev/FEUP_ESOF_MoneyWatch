import 'package:flutter/material.dart';
import '../Model/User.dart';

class AddHabitView extends StatefulWidget {

  AddHabitView({super.key, required this.title, required this.user});
  final String title;
  User user;

  @override
  State<AddHabitView> createState() => _AddHabitView();
}

class _AddHabitView extends State<AddHabitView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}