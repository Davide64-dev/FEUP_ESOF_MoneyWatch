import 'dart:core';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class BarModel {
  final String month;
  final double amount;
  final charts.Color barColor;

  BarModel({required this.month, required this.amount, required this.barColor});
}

class StatisticsPageView extends StatelessWidget {

  bool isSwitched = false;

  final List<BarModel> data = [
    BarModel(month: "Mar", amount: 102.5,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    BarModel(month: "Feb", amount: 105.2,
        barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Statistics"),
      ),
      body: Center(
        child: CategoryChart(
            data: data
        ),
      ),
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
        domainFn: (BarModel model, _) => model.month,
        measureFn: (BarModel model, _) => model.amount,
        colorFn: (BarModel model, _) => model.barColor,
      )
    ];


    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Spending by month",
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