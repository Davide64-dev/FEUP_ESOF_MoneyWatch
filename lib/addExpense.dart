import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pie_chart/pie_chart.dart';

class addExpense extends StatefulWidget {
  const addExpense({super.key, required this.title});
  final String title;

  @override
  State<addExpense> createState() => _addExpense();
}


class _addExpense extends State<addExpense> {


  @override
  Widget build(BuildContext context) {
    String dropdownvalue = '€';
    var items = [
      "€",
      "\$",
      "£",
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(-0.5, -0.7),
             child: DropdownButton<String>(
               value: dropdownvalue,

               icon: const Icon(Icons.keyboard_arrow_down),

                 onChanged: (newValue) async{
                   setState(() {
                     dropdownvalue = newValue!;
                   });
                 },

                items: items.map((String items){
                  return DropdownMenuItem<String>(
                    value: items,
                    child: Text(items),
                );
              }).toList(),


            )
          )

          ,Align(
            //alignment: Alignment(50, 50),
          alignment: Alignment(0, 0.9),

            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                // Code
              },
              icon: Icon(Icons.save),
              label: Text("Submit"),

            )
      ),
        ],

      ),
    );
  }
}