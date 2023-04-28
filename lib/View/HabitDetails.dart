import 'package:flutter/material.dart';
import '../Model/Habit.dart';
import '../Model/User.dart';

class HabitDetails extends StatefulWidget {
  User user;
  Habit habit;
  HabitDetails({super.key, required this.title, required this.habit, required this.user});
  final String title;

  @override
  State<HabitDetails> createState() => _HabitDetails();
}

class _HabitDetails extends State<HabitDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
    );
  }
}