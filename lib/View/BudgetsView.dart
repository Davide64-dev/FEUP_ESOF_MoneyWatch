import 'dart:async';
import 'dart:core';
import 'package:MoneyWatch/View/AddHabitView.dart';
import 'package:MoneyWatch/View/HabitDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../Model/Budget.dart';
import '../Model/User.dart';
import '../Model/Habit.dart';
import 'BudgetDetails.dart';
import 'CreateBudget.dart';

class BudgetsView extends StatefulWidget {
  User user;
  List<Budget> budgets = [];
  BudgetsView({super.key, required this.title, required this.user});
  final String title;

  @override
  State<BudgetsView> createState() => _BudgetsView();

  void getBudgets() async{
    CollectionReference budgets = FirebaseFirestore.instance.collection('Budgets');
    QuerySnapshot snapshot1 = await budgets.where('user', isEqualTo: user.email).get();
    getBudgetsWithSnapshot(snapshot1);
  }

  void getBudgetsWithSnapshot(QuerySnapshot value){
    value.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String category = data["category"];
      double amount = data["amount"];
      Budget budget = Budget(amount, category);
      budgets.add(budget);
      print(budgets.length);
    });
  }
}


class _BudgetsView extends State<BudgetsView> {

  late Timer _everySecond;

  @override
  void initState() {
    super.initState();

    // sets first value
    var _now = DateTime.now().second.toString();

    // defines a timer
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
          itemCount: widget.budgets.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BudgetDetails(
                            title: "Budget Details",
                            budget: widget.budgets[index],
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
                            widget.budgets[index].category,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Budget? newBudget = await showDialog<Budget>(
            context: context,
            builder: (BuildContext context) {
              return CreateBudget(user: widget.user);
            },
          );
        },
        tooltip: 'Create New Post',
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
