import 'package:flutter/material.dart';
import '../Model/Purchase.dart';
import '../Model/User.dart';

class EditExpenseView extends StatefulWidget {

  EditExpenseView({super.key, required this.title, required this.user, required this.purchase});
  final String title;
  User user;
  Purchase purchase;

  @override
  State<EditExpenseView> createState() => _EditExpenseView();
}


class _EditExpenseView extends State<EditExpenseView> {
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
    var _amountController = TextEditingController(text: widget.purchase.amount.toString());
    var _descriptionController = TextEditingController(text: widget.purchase.description);

    return Scaffold(
      appBar: AppBar(
        key: const Key('Edit Expense'),
        title: const Text('Edit Expense'),
      ),
      body: Stack(
        children: [
          Align(
              alignment: const Alignment(-0.5, -0.7),
              child: DropdownButton<String>(
                value: dropdownvalue,
                underline: const SizedBox(),

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
              alignment: const Alignment(0.3, -0.7),
              child: SizedBox(
                width: 100,
                //height: 10,
                child: TextField(
                    key: const Key("Amount"),
                    controller: _amountController,
                    decoration: const InputDecoration(),
                    keyboardType: TextInputType.number,
                    onChanged: (String val) async {
                      _amountController.text = val;
                    }),
              )
          ),


          Align(
              alignment: const Alignment(0, -0.45),
              child: DropdownButton<String>(
                value: widget.purchase.category,
                underline: const SizedBox(),

                icon: const Icon(Icons.keyboard_arrow_down),

                onChanged: (String? newValue){
                  widget.purchase.category = newValue!;
                  setState(() {
                    widget.purchase.category = newValue!;
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
            alignment: const Alignment(-1, -0.2),
            child: SizedBox(
              width: 250,
              child: SwitchListTile(
                  title: const Text("Recurring Expense"),
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
            alignment: const Alignment(0, 0.6),
            child: SizedBox(
              width: 300,
              child: TextField(
                  controller: _descriptionController,
                  cursorHeight: 20,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Description',

                  ),
                  onChanged: (String val) async {
                    _descriptionController.text = val;
                  }),
            ),
          ),

          Align(
              alignment: const Alignment(0, 0.9),

              child: ElevatedButton.icon(
                  onPressed: () {
                    var amount;

                    if (isValid(_amountController.text)) {
                      amount = double.parse(_amountController.text).toDouble();
                      amount = double.parse(amount.toStringAsFixed(2));
                      widget.purchase.setAttributes(amount, _descriptionController.text
                          , widget.purchase.category, nr_daysInput);
                      Navigator.pop(context);

                      _showSuccessAdvice();
                    }
                    else{
                      _showErrorAdvice();
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("Submit"),
                  key: const Key("Submit")


              )
          ),
        ],

      ),
    );
  }

  void _showSuccessAdvice() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully Edited Expense!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorAdvice() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        key: Key("Error Submit"),
        content: Text('Something Went Wrong!'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }
}