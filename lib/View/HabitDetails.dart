import 'dart:ffi';

import 'package:MoneyWatch/View/EditHabitView.dart';
import 'package:flutter/material.dart';
import '../Model/Habit.dart';
import '../Model/User.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HabitDetails extends StatefulWidget {
  User user;
  Habit habit;
  HabitDetails({super.key, required this.title, required this.habit, required this.user});
  final String title;

  @override
  State<HabitDetails> createState() => _HabitDetails();
}

class _HabitDetails extends State<HabitDetails> {

  List<Color> colorList = [
    const Color(0xff3398f6),
    const Color(0xffd95af3)
  ];

  @override
  Widget build(BuildContext context) {

    Duration dayspassed = DateTime.now().difference(widget.habit.startDate);
    double amountsaved = dayspassed.inDays * widget.habit.amountPerDay;
    Map<String, double> ret = {};
    ret[widget.habit.name] = amountsaved;
    ret['test'] = amountsaved / 2;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment(0.0, -0.8),
            child: Text(
              widget.habit.name,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: 200,
            height: 200,
           child: PieChart(

            dataMap: ret,
            centerText: "${dayspassed.inDays.toString()} days",
            colorList: colorList,
            chartType: ChartType.ring,
            ringStrokeWidth: 25,
            chartRadius: MediaQuery.of(context).size.width / 3,
            animationDuration: Duration(seconds: 1),
            chartLegendSpacing: 64,
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: false,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              chartValueStyle: TextStyle(
                fontSize: 20, // Adjust the font size to make the text bigger
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust the color of the text
              ),
            ),
            legendOptions: LegendOptions(
              showLegends: false,
            ),
          ),
         ),
          Container(
            width: 200,
            height: 200,
            child: PieChart(

              dataMap: ret,
              centerText: "${amountsaved.toString()} €\nsaved",
              colorList: colorList,
              chartType: ChartType.ring,
              ringStrokeWidth: 25,
              chartRadius: MediaQuery.of(context).size.width / 3,
              animationDuration: Duration(seconds: 1),
              chartLegendSpacing: 64,
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: false,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                chartValueStyle: TextStyle(
                  fontSize: 20, // Adjust the font size to make the text bigger
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Adjust the color of the text
                ),
              ),
              legendOptions: LegendOptions(
                showLegends: false,
              ),
            ),
          ),
      ]
      ),
      floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SpeedDial(
              key: Key("EditHabit"),
              child: Icon(Icons.edit),
              backgroundColor: Colors.green,
              onPress: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                EditHabitView(title: 'Edit Habit', user: widget.user, habit: widget.habit,)),
                );
              }
          ),
          SizedBox(height: 20),
          SpeedDial(
            key: Key("DeleteHabit"),
            child: Icon(Icons.delete),
            backgroundColor: Colors.green,
            onPress: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete Habit'),
                      content: Text('Are you sure you want to delete this habit?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              widget.user.habits.remove(widget.habit);
                            });
                            Navigator.pop(context); // Close the dialog
                            Navigator.pop(context);
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  }
              );
            }
          ),
        ]
      )
    );
  }
}