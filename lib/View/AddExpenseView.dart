import 'package:flutter/material.dart';

import '../Model/User.dart';

class AddExpenseView extends StatefulWidget {

  AddExpenseView({super.key, required this.title, required this.user});
  final String title;
  User user;

  @override
  State<AddExpenseView> createState() => _AddExpenseView();
}


class _AddExpenseView extends State<AddExpenseView> {


  @override
  Widget build(BuildContext context) {
    String category = 'Leisure';
    bool isSwitched = false;


    var amountInput = "";
    String categoryInput = category;
    String descriptionInput = "";
    int nr_daysInput = 0;
    String dropdownvalue = '€';
    var items = [
      "€",
    ];

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

                onChanged: (newValue) async {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },

                items: items.map((String items) {
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
                    onChanged: (String val) async {
                      amountInput = val;
                    }),
              )
          ),


          Align(
              alignment: Alignment(0, -0.45),
              child: DropdownButton<String>(
                value: category,
                underline: SizedBox(),

                icon: const Icon(Icons.keyboard_arrow_down),

                onChanged: (newValue) async {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },

                items: categories.map((String categories) {
                  return DropdownMenuItem<String>(
                    value: categories,
                    child: Text(categories),
                  );
                }).toList(),


              )
          ),

          Align(
            alignment: Alignment(-1, -0.2),
            child: SizedBox(
              width: 250,
              child: SwitchListTile(
                  title: Text("Recurring Expense"),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    }
                    );
                  }),
            ),
          ),

          Align(
            alignment: Alignment(0, 0.6),
            child: SizedBox(
              width: 300,
              child: TextField(

                  cursorHeight: 20,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Description',

                  ),
                  onChanged: (String val) async {
                    descriptionInput = val;
                  }),
            ),
          ),

          Align(
            //alignment: Alignment(50, 50),
              alignment: Alignment(0, 0.9),

              child: ElevatedButton.icon(
                onPressed: () {
                  double amount = double.parse(amountInput);
                  if (amount == 0) return;


                  widget.user.addPurchase(amount, descriptionInput
                      , categoryInput, nr_daysInput as int);
                  Navigator.pop(context);
                  // Code
                  _showAdvice();
                },
                icon: Icon(Icons.save),
                label: Text("Submit"),


              )
          ),
        ],

      ),
    );
  }

  void _showAdvice() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Successfully Added Expense'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}