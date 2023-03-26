import 'dart:core';

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class BarModel {
  final String month;
  final double amount;

  BarModel({required this.month, required this.amount});
}

class StatisticsPageView extends StatefulWidget {
  const StatisticsPageView({super.key, required this.title});
  final String title;

  @override
  State<StatisticsPageView> createState() => _StatisticsPageView();
}


class _StatisticsPageView extends State<StatisticsPageView> {

  bool isSwitched = false;
/*
  List<Color> colorList = [
    const Color(0xffd95af3),
    const Color(0xff3EE094),
    const Color(0xff3398f6),
    const Color(0xfffa4a42),
    const Color(0xfffe9539),
  ];*/

  String month = 'Mar';
  var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

  String category = 'Leisure';
  var categories = ["Leisure", "Food", "Transport", "Education"];

  double amount = 100;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
          appBar: AppBar(
            title: const Text('Statistics'),
          ),
          body: Container(
              height: 300,
              child: charts.BarChart(
                charts.Series<BarModel, String>(
                    data: [BarModel(month: "Mar", amount: 100), BarModel(month: "Feb", amount: 200)],
                    id: "stats",
                    colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                    domainFn: (BarModel barModel, _) => barModel.month,
                    measureFn: (BarModel barModel, _) => barModel.amount,
                ) as List<Series<dynamic, String>>,
                animate: false,
              )
          )
      )
    );
    /*return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
      ),
      body: Container(
        height: 300,
        child: charts.BarChart(
          charts.Series<BarModel, String>(
            data: [BarModel(month: "Mar", amount: 100), BarModel(month: "Feb", amount: 200)],
            id: "stats",
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (BarModel barModel, _) => barModel.month,
            measureFn: (BarModel barModel, _) => barModel.amount;
          ) as List<Series<dynamic, String>>,
              animate: false,
        )
      )
    );*/
  }
}