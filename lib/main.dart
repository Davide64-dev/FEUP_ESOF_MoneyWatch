import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'MoneyWatch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Map<String, double> dataMap = {
    "Food": 20,
    "Leisure": 30,
    "Transport": 15,
    "Education": 35,
  };

  List<Color> colorList = [
    const Color(0xffd95af3),
    const Color(0xff3EE094),
    const Color(0xff3398f6),
    const Color(0xfffa4a42),
    const Color(0xfffe9539),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: PieChart(
          dataMap: dataMap,
          colorList: colorList,
          chartType: ChartType.ring,
          chartRadius: MediaQuery.of(context).size.width / 2,
          chartValuesOptions: ChartValuesOptions(

          ),
          legendOptions: LegendOptions(
            showLegends: true,
            legendShape: BoxShape.rectangle,
            legendPosition: LegendPosition.bottom,
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        curve: Curves.easeInSine,
        spaceBetweenChildren: 15,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
          ),
          SpeedDialChild(
            child: Icon(Icons.forum),
            backgroundColor: Colors.green,
          ),
          SpeedDialChild(
            child: Icon(Icons.percent),
            backgroundColor: Colors.green,
          ),
          SpeedDialChild(
            child: Icon(Icons.psychology),
            backgroundColor: Colors.green,
          ),
          SpeedDialChild(
            child: Icon(Icons.savings),
            backgroundColor: Colors.green,
          ),

        ],
        child: Icon(Icons.attach_money)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
