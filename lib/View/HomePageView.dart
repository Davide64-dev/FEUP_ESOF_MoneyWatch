import 'package:MoneyWatch/View/HabitTrackerView.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:MoneyWatch/View/AddExpenseView.dart';
import 'package:MoneyWatch/View/StatisticsPageView.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Model/User.dart';
import 'BudgetsView.dart';
import 'Forum/ForumPage.dart';


class HomePage extends StatefulWidget {
  User user;
  HomePage({super.key, required this.title, required this.user});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

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

  List<Color> colorList = [
    const Color(0xffd95af3),
    const Color(0xff3EE094),
    const Color(0xff3398f6),
    const Color(0xfffa4a42),
    const Color(0xfffe9539),
    const Color(0xffa81278)
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

          dataMap: widget.user.getSumPurchases(DateTime.now().
          subtract(const Duration(days: 30)),DateTime.now()),
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
          key: Key("MainButton"),
          curve: Curves.easeInSine,
          spaceBetweenChildren: 15,
          children: [
            SpeedDialChild(
              key: Key("AddButton"),
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                  AddExpenseView(title: 'Add Expense', user: widget.user)),
                );
              },
            ),
            SpeedDialChild(
              key: Key("Forum"),
              child: Icon(Icons.forum),
              backgroundColor: Colors.green,
              onTap: () {
                ForumPage page = ForumPage(title: 'Forum', user: widget.user);
                page.getTopics();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                );
              },
            ),
            SpeedDialChild(
              key: Key("Statistics"),
              child: Icon(Icons.percent),
              backgroundColor: Colors.green,
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatisticsPageView(title: "Statistics", user: widget.user))
                );
              },
            ),
            SpeedDialChild(
              key: Key("Habits"),
              child: Icon(Icons.psychology),
              backgroundColor: Colors.green,
              onTap: () {
                HabitTrackerView page = HabitTrackerView(title: "Habits", user: widget.user);
                page.getHabits();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page)
                );
              },
            ),
            SpeedDialChild(
              key: Key("Psychology"),
              child: Icon(Icons.savings),
              backgroundColor: Colors.green,
              onTap: () {
                BudgetsView page = BudgetsView(title: "Budgets", user: widget.user);
                page.getBudgets();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page)
                );
              },
            ),

            SpeedDialChild(
              key: Key("Logout"),
              child: Icon(Icons.logout),
              backgroundColor: Colors.green,
              onTap: () => auth.FirebaseAuth.instance.signOut(),
            ),

          ],
          child: Icon(Icons.attach_money)
      ),
    );
  }
}

