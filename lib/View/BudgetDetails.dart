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
    const Color(0xF0F0F0F0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key(widget.title),
        title: Text(widget.title),
      ),


      body: Container(
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

    );
  }


}