import 'package:flutter/material.dart';

class addExpense extends StatefulWidget {
  const addExpense({super.key, required this.title});
  final String title;

  @override
  State<addExpense> createState() => _addExpense();
}


class _addExpense extends State<addExpense> {


  @override
  Widget build(BuildContext context) {
    bool _showInputBoxTable = false;
    String dropdownvalue = '€';
    var items = [
      "€",
      "\$",
      "£",
    ];

    String category = 'Leisure';
    var categories = [
      "Leisure",
      "Food",
      "Transport",
      "Education",
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
                 underline: SizedBox(),

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
          ),

          Align(
            alignment: Alignment(0.3, -0.7),
            child: SizedBox(
                width: 100,
              //height: 10,
              child: TextField(
                decoration: new InputDecoration(),
                keyboardType: TextInputType.number,

                )
            ),
            ),

          Align(
              alignment: Alignment(0, -0.35),
              child: DropdownButton<String>(
                value: category,
                underline: SizedBox(),

                icon: const Icon(Icons.keyboard_arrow_down),

                onChanged: (newValue) async{
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },

                items: categories.map((String categories){
                  return DropdownMenuItem<String>(
                    value: categories,
                    child: Text(categories),
                  );
                }).toList(),


              )
          ),

          Align(
            alignment: Alignment(0, -0.1),
              child: RadioListTile(
                  title: Text("Recurring Expense"),
                  value: "radio value",
                  groupValue: "",
                  onChanged: (value) {
                    setState(() {

                      _showInputBoxTable = true;
                    }
                    );
                  }),
              ),



          Align(
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