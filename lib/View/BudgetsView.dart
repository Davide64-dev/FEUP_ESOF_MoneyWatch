import 'dart:core';
import 'package:MoneyWatch/View/AddHabitView.dart';
import 'package:MoneyWatch/View/HabitDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../Model/User.dart';
import '../Model/Habit.dart';

class BudgetsView extends StatefulWidget {
  User user;
  BudgetsView({super.key, required this.title, required this.user});
  final String title;

  @override
  State<BudgetsView> createState() => _BudgetsView();
}


class _BudgetsView extends State<BudgetsView> {

  /*
  @override
  void initState() {
    widget.user.habits = habits;
    super.initState();
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: widget.user.budgets.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              /*
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HabitDetails(
                            title: "Habit Details",
                            habit: widget.user.budgets[index],
                            user: widget.user,
                          ),
                    ),
                  );
                },

               */
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
                            widget.user.budgets[index].name,
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
