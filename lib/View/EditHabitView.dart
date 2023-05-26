import 'package:flutter/material.dart';
import '../Model/Habit.dart';
import '../Model/User.dart';

class EditHabitView extends StatefulWidget {

  EditHabitView({super.key, required this.title, required this.user, required this.habit});
  final String title;
  User user;
  Habit habit;

  @override
  State<EditHabitView> createState() => _EditHabitView();
}

class _EditHabitView extends State<EditHabitView> {
  bool isValid(var x) {
    int count = 0;
    int countZeros = 0;
    for (int i = 0; i < x.length; i++) {
      if (x[i] == ',') return false;
      if (x[i] == '.') count++;
      if (count == 2) return false;
      if (x[i] == '0') countZeros++;
    }

    if (countZeros == x.length) return false;
    if (x == "" || x == '.') return false;
    if (x == 0) return false;

    return true;
  }

  @override
  Widget build(BuildContext context) {

    var _titleController = TextEditingController(text: widget.habit.name);
    var _amountController = TextEditingController(text: widget.habit.amountPerDay.toString());
    var _descriptionController = TextEditingController(text: widget.habit.description);


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
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the name',

                  ),
                  onChanged: (String val) async {
                    _titleController.text = val;
                  }),
            ),
          ),
          Align(
              alignment: Alignment(0.0, -0.2),
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
            alignment: Alignment(0, 0.4),
            child: SizedBox(
              width: 300,
              child: TextField(

                  cursorHeight: 20,
                  maxLines: 2,
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the description',

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

                    if (_amountController.text == ""){
                      widget.user.removeHabitToDatabase(widget.habit.id);
                      Navigator.pop(context);
                      Navigator.pop(context);

                      _showSuccessAdvice('Successfully Removed Habit!');
                    }

                    else if (isValid(_amountController.text)) {
                      amount = double.parse(_amountController.text).toDouble();
                      amount = double.parse(amount.toStringAsFixed(2));

                      if (amount != 0) {
                        widget.habit.setAttributes(_titleController.text,
                            _descriptionController.text, amount);
                        Navigator.pop(context);

                        _showSuccessAdvice('Successfully Edited Habit!');
                      }
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

  void _showSuccessAdvice(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
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