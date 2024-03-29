import 'dart:io';
import 'package:flutter/material.dart';
import '../Model/User.dart';

class AddExpenseView extends StatefulWidget {

  AddExpenseView({super.key, required this.title, required this.user});
  final String title;
  User user;
  String category = 'Leisure';
  var amountInput = "";
  String descriptionInput = "";

  @override
  State<AddExpenseView> createState() => _AddExpenseView();
}


class _AddExpenseView extends State<AddExpenseView> {
  late File imageFile;

  bool isValid(var x){
    int count = 0;
    int countZeros = 0;
    for (int i = 0; i < x.length;i++){
      if (x[i] == ',') return false;
      if(x[i] == '.') count++;
      if (count == 2) return false;
      if(x[i] == '0') countZeros++;
    }
    if(countZeros == x.length) return false;
    if (x == "" || x == '.') return false;
    if (x == 0) return false;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

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
        key: Key('Add Expense'),
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
                    key: Key("Amount"),
                    decoration: new InputDecoration(),
                    keyboardType: TextInputType.number,
                    onChanged: (String val) async {
                      widget.amountInput = val;
                    }),
              )
          ),


          Align(
              alignment: Alignment(0, -0.45),
              child: DropdownButton<String>(
                value: widget.category,
                underline: SizedBox(),

                icon: const Icon(Icons.keyboard_arrow_down),

                onChanged: (String? newValue){
                  widget.category = newValue!;
                  setState(() {
                    widget.category = newValue!;
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
                    widget.descriptionInput = val;
                  }),
            ),
          ),

          Align(
              alignment: Alignment(0, 0.9),

              child: ElevatedButton.icon(
                onPressed: () {
                  var amount;

                  if (isValid(widget.amountInput)) {
                    amount = double.parse(widget.amountInput).toDouble();
                    amount = double.parse(amount.toStringAsFixed(2));
                    widget.user.addPurchasetoDatabase(amount, widget.descriptionInput
                        , widget.category, nr_daysInput, DateTime.now());
                    Navigator.pop(context);

                    _showSuccessAdvice();
                  }
                  else{
                    _showErrorAdvice();
                  }
                },
                icon: Icon(Icons.save),
                label: Text("Submit"),
                key: Key("Submit")
              )
          ),
        ],

      ),
    );
  }

  void _showSuccessAdvice() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Successfully Added Expense!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorAdvice() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: Key("Erro Sumbit"),
        content: Text('Something Went Wrong!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }
}

