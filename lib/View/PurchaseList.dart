import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import '../Model/User.dart';
import 'EditExpenseView.dart';

class PurchaseList extends StatefulWidget {
  User user;
  PurchaseList({super.key, required this.title, required this.user});
  final String title;

  @override
  State<PurchaseList> createState() => _PurchaseList();
}

class _PurchaseList extends State<PurchaseList>  {

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
        itemCount: widget.user.purchases.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditExpenseView(title: "Edit Expense", purchase: widget.user.purchases[index], user: widget.user,)),

                );
              },
              child: Container(
                  padding: EdgeInsets.all(24.0),
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(
                color: Color(0xADD8E6FF),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(-0.9, 0),
                    child: Text(
                      widget.user.purchases[index].category,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      widget.user.purchases[index].datetime.year.toString() + "/" +
                        widget.user.purchases[index].datetime.month.toString() + "/" +
                          widget.user.purchases[index].datetime.day.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),

                  ),
                  Align(
                    alignment: Alignment(0.9,0),
                    child: Text(
                      widget.user.purchases[index].amount.toString() + "€",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ]
              )
              )
          );
        },
      ),
    );
  }


}
