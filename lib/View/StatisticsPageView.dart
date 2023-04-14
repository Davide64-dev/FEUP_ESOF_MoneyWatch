import 'dart:core';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../Model/User.dart';

class BarModel {
  final String category;
  final double amount;
  final charts.Color barColor;

  BarModel({required this.category, required this.amount, required this.barColor});
}

class StatisticsPageView extends StatefulWidget {
  User user;
  StatisticsPageView({super.key, required this.title, required this.user});
  final String title;

  @override
  State<StatisticsPageView> createState() => _StatisticsPageView();
}

class _StatisticsPageView extends State<StatisticsPageView> {

  final List<BarModel> data = [
    BarModel(category: "Leisure", amount: 102.5,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    BarModel(category: "Food", amount: 105.2,
        barColor: charts.ColorUtil.fromDartColor(Colors.green)),
    BarModel(category: "Transportation", amount: 30.0,
        barColor: charts.ColorUtil.fromDartColor(Colors.purpleAccent)),
    BarModel(category: "Education", amount: 40.0,
        barColor: charts.ColorUtil.fromDartColor(Colors.red)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Statistics"),
      ),
      body: Stack(
          children: [
            Align(
                alignment: Alignment(0, -0.9),
                child: CategoryChart(
                    data: data
                )
            ),
            Align(
              alignment: Alignment(0, 0.25),
              child: SizedBox(
                width: 250,
                child: InkWell(
                  onTap: () {
                    //_selectDate(context);
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "From",
                      border: OutlineInputBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          DateFormat('MM/dd/yyyy').format(DateTime.now()),
                          //style: TextStyle(fontSize: 16.0),
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment(0, 0.60),
              child: SizedBox(
                width: 250,
                child: InkWell(


                  onTap: () {
                    //_selectDate(context);
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: "To",
                      border: OutlineInputBorder(),

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          DateFormat('MM/dd/yyyy').format(DateTime.now()),
                          //style: TextStyle(fontSize: 16.0),
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StatisticsPageView(title: "Statistics", user: widget.user))
          );
        },
        child: Icon(Icons.receipt_long),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}



class CategoryChart extends StatelessWidget {
  final List<BarModel> data;

  CategoryChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarModel, String>> series = [
      charts.Series(
        id: "Stats",
        data: data,
        domainFn: (BarModel model, _) => model.category,
        measureFn: (BarModel model, _) => model.amount,
        colorFn: (BarModel model, _) => model.barColor,
      )
    ];


    return Container(
      height: 340,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Spending by category",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}