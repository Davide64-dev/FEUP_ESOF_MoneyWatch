import 'package:flutter/material.dart';
import '../../Model/User.dart';
import '../Utils/Validator.dart';

class CreateBudget extends StatefulWidget {
  final User user;

  CreateBudget({required this.user});

  @override
  _CreateBudgetState createState() => _CreateBudgetState();
}



class _CreateBudgetState extends State<CreateBudget> {
  String category = "Leisure";
  var categories = [
    "Leisure",
    "Food",
    "Transport",
    "Education",
  ];

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Create New Budget"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DropdownButton<String>(
            value: category,
            underline: SizedBox(),

            icon: const Icon(Icons.keyboard_arrow_down),

            onChanged: (String? newValue){
              category = newValue!;
              setState(() {
                category = newValue!;
              });
            },

            items: categories.map((String categories) {
              return DropdownMenuItem<String>(
                value: categories,
                child: Text(categories),
              );
            }).toList(),




          ),
          SizedBox(height: 8.0),
          TextField(
            keyboardType: TextInputType.number,
            controller: amountController,
            decoration: InputDecoration(
              hintText: "Enter Amount per month",
            ),
            maxLines: null,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            String amount1 = amountController.text;
            if (Validator.isValidAmount(amount1)) {
              double amount = double.parse(amount1).toDouble();
              amount = double.parse(amount.toStringAsFixed(2));
              widget.user.addBudgettoDatabase(category, amount);
            }
            Navigator.pop(context);
          },
          child: Text("Create"),
        ),
      ],
    );
  }
}