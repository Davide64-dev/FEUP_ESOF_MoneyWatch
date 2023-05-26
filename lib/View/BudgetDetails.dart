import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Model/Budget.dart';
import '../Model/User.dart';

class BudgetDetails extends StatefulWidget {
  User user;
  Budget budget;
  final String title;
  BudgetDetails({super.key, required this.user, required this.title, required this.budget});
  @override
  State<BudgetDetails> createState() => _BudgetDetails();
}

class _BudgetDetails extends State<BudgetDetails>{


  List<Color> colorList = [
    const Color(0xfffa4a42),
    const Color(0x48484848)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key(widget.title),
        title: Text(widget.title),
      ),


      body: Stack(
        children: [

          Align(
            alignment: Alignment(0, -0.8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Text(
                calculateDaysLeftInMonth().toString() + " days to finnish the month",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment(0, 0.8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Text(
                "Monthly Budget: " + widget.budget.amount.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomRight,
            child: PieChart(
              dataMap: widget.user.getPurchasesMTD(widget.budget),
              centerText: widget.budget.category,
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
                showLegends: false,
                legendShape: BoxShape.circle,
                legendPosition: LegendPosition.bottom,
              ),
            ),
          ),
        ],
      ),


    );
  }
}

int calculateDaysLeftInMonth() {
  DateTime currentDate = DateTime.now();

  DateTime nextMonthFirstDay = DateTime(currentDate.year, currentDate.month + 1, 1);

  Duration difference = nextMonthFirstDay.difference(currentDate);

  int daysLeft = difference.inDays - 1;

  return daysLeft;
}