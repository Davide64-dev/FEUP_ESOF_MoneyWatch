import 'dart:core';
import 'package:MoneyWatch/View/AddHabitView.dart';
import 'package:MoneyWatch/View/HabitDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../Model/User.dart';
import '../Model/Habit.dart';

class HabitTrackerView extends StatefulWidget {
  User user;
  HabitTrackerView({super.key, required this.title, required this.user});
  final String title;

  @override
  State<HabitTrackerView> createState() => _HabitTracker();
}


class _HabitTracker extends State<HabitTrackerView> {

  List<Habit> habits = [Habit('Smoking', 'Quit smoking', DateTime(2023, 05, 03), 4),
                        Habit('Coffee', 'Drink less coffee', DateTime(2023, 04, 15), 3),
                        Habit('Restaurant', 'Reduce the number of times I eat out', DateTime(2023, 03, 20), 3)];

  @override
  void initState() {
    widget.user.habits = habits;
    super.initState();
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
          child: ListTile(
            title: Text(widget.user.habits[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amount per day: ${widget.user.habits[index].amountPerDay
                    .toString()}"),
                Text("Description: ${widget.user.habits[index].description}"),
              ],
            ),
            trailing: Text("Start date: ${widget.user.habits[index].startDate
                .toString()}"),
          ),
        );
      }
    ),
      floatingActionButton: SpeedDial(
        key: Key("AddHabits"),
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      /*body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.user.habits.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HabitDetails(
                          title: "Habit Details",
                          habit: widget.user.habits[index],
                          user: widget.user,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(widget.user.habits[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Amount per day: ${widget.user.habits[index].amountPerDay.toString()}"),
                        Text("Description: ${widget.user.habits[index].description}"),
                      ],
                    ),
                    trailing: Text("Start date: ${widget.user.habits[index].startDate.toString()}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),*/
    );
  }
}
