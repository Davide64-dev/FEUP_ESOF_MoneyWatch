import 'package:MoneyWatch/View/HabitTrackerView.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:MoneyWatch/View/AddExpenseView.dart';
import 'package:MoneyWatch/View/StatisticsPageView.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Model/Budget.dart';
import '../Model/User.dart';
import 'BudgetsView.dart';
import 'Forum/ForumPage.dart';

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
                color: Colors.greenAccent,  // Set the background color
                borderRadius: BorderRadius.circular(8),  // Set border radius
              ),
              padding: EdgeInsets.all(8),  // Set padding
              child: Text(
                calculateDaysLeftInMonth().toString() + " days to finnish the month",
                style: TextStyle(
                  color: Colors.black,  // Set text color
                  fontSize: 18,  // Set font size
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment(0, 0.8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,  // Set the background color
                borderRadius: BorderRadius.circular(8),  // Set border radius
              ),
              padding: EdgeInsets.all(8),  // Set padding
              child: Text(
                "Monthly Budget: " + widget.budget.amount.toString(),
                style: TextStyle(
                  color: Colors.black,  // Set text color
                  fontSize: 18,  // Set font size
                ),
              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomRight, // Align to the bottom-right corner
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
  // Get the current date
  DateTime currentDate = DateTime.now();

  // Get the first day of the next month
  DateTime nextMonthFirstDay = DateTime(currentDate.year, currentDate.month + 1, 1);

  // Calculate the difference in days between the next month's first day and the current date
  Duration difference = nextMonthFirstDay.difference(currentDate);

  // Subtract 1 day to exclude the current day from the count
  int daysLeft = difference.inDays - 1;

  return daysLeft;
}