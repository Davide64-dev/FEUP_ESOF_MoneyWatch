import 'package:flutter/material.dart';
import '../Model/User.dart';
import 'package:intl/intl.dart';

class AddHabitView extends StatefulWidget {

  AddHabitView({super.key, required this.title, required this.user});
  final String title;
  User user;
  String nameInput = "";
  var amountInput = "";
  String descriptionInput = "";
  DateTime date = DateTime.now();

  @override
  State<AddHabitView> createState() => _AddHabitView();
}

class _AddHabitView extends State<AddHabitView> {

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0.0, -0.7),
            child: SizedBox(
              width: 300,
              child: TextField(

                  cursorHeight: 10,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the name',

                  ),
                  onChanged: (String val) async {
                    widget.nameInput = val;
                  }),
            ),
          ),
          Align(
              alignment: Alignment(0.0, -0.4),
              child: SizedBox(
                width: 100,
                //height: 10,
                child: TextField(
                    key: Key("Amount"),
                    decoration: InputDecoration(
                      labelText: "Amount", // Add the title here
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String val) async {
                      widget.amountInput = val;
                    }),
              )
          ),
          Align(
            alignment: Alignment(0.0, 0.0),
            child: SizedBox(
              width: 250,
              child: InkWell(
                onTap: () {

                },
                child: GestureDetector(
                  onTap: () async{
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );

                    if (picked != null && picked != widget.date) {
                      setState(() {
                        widget.date = picked;
                        print(picked);
                      });
                    }
                  },

                  child: InputDecorator(


                    decoration: InputDecoration(
                      labelText: "Start date",
                      border: OutlineInputBorder(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          DateFormat('MM/dd/yyyy').format(widget.date),
                        ),
                        Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: SizedBox(
              width: 300,
              child: TextField(

                  cursorHeight: 20,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    hintText: 'Enter the description',

                  ),
                  onChanged: (String val) async {
                    widget.descriptionInput = val;
                  }),
            ),
          ),
          /*Align(
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
          ),*/
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