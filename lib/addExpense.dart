import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pie_chart/pie_chart.dart';

class addExpense extends StatelessWidget {
  const addExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Stack(
        children: [
          Align(
            //alignment: Alignment(50, 50),
          alignment: Alignment(0, 0.9),

            child: FloatingActionButton(

              onPressed: () {
                Navigator.pop(context);
                // Code
              },

            )
      ),
        ],

      ),
    );
  }
}