import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:name/View/addExpense.dart';
import 'package:pie_chart/pie_chart.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
      body: Container(
        child: PieChart(
          dataMap: dataMap,
          centerText: "Last Month",
          colorList: colorList,
          chartType: ChartType.ring,
          ringStrokeWidth: 32,
          chartRadius: MediaQuery.of(context).size.width / 2,
          animationDuration: Duration(seconds: 1),
          chartLegendSpacing: 64,
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: true,
          ),
          legendOptions: LegendOptions(
            showLegends: true,
            legendShape: BoxShape.circle,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const AddExpenseView(title: 'Add Expense',)),
                );
              },
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

