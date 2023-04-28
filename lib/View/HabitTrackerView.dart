import 'dart:core';
import 'package:MoneyWatch/View/AddHabitView.dart';
import 'package:MoneyWatch/View/HabitDetails.dart';
import 'package:flutter/material.dart';
import '../Model/User.dart';


class HabitTrackerView extends StatefulWidget {
  User user;
  HabitTrackerView({super.key, required this.title, required this.user});
  final String title;

  @override
  State<HabitTrackerView> createState() => _HabitTracker();
}


class _HabitTracker extends State<HabitTrackerView> {

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
