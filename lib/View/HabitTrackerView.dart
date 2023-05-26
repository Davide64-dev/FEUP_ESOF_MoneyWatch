import 'dart:async';
import 'dart:core';
import 'package:MoneyWatch/View/AddHabitView.dart';
import 'package:MoneyWatch/View/HabitDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../Model/User.dart';
import '../Model/Habit.dart';

class HabitTrackerView extends StatefulWidget {
  User user;
  HabitTrackerView({super.key, required this.title, required this.user});
  final String title;

  void getHabits() async{
    user.habits = [];
    CollectionReference budgets = FirebaseFirestore.instance.collection('Habits');
    QuerySnapshot snapshot1 = await budgets.where('user', isEqualTo: user.email).get();
    getHabitsWithSnapshot(snapshot1);
  }

  void getHabitsWithSnapshot(QuerySnapshot value){
    value.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String id = doc.id;
      DateTime date = DateTime.parse(data['date']);
      double amount = data["amount"];
      String description = data["description"];
      String title = data["title"];
      Habit habit = Habit(id, title, description, date, amount);
      user.habits.add(habit);
    });
  }



  @override
  State<HabitTrackerView> createState() => _HabitTracker();
}


class _HabitTracker extends State<HabitTrackerView> {

  late Timer _everySecond;

  @override
  void initState() {
    super.initState();

    var _now = DateTime.now().second.toString();

    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.user.habits.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HabitDetails(
                      title: "Habit Details",
                      habit: widget.user.habits[index],
                      user: widget.user,
                    ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
                borderRadius: BorderRadius.circular(10),
                ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      widget.user.habits[index].name,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
        ));
      }
    ),
      floatingActionButton: SpeedDial(
        key: Key("AddHabits"),
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddHabitView(
                    title: "Add Habit",
                    user: widget.user,
                  ),
            ),
          );
        },
      ),
    );
  }
}
