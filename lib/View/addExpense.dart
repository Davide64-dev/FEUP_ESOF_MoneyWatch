import 'package:flutter/material.dart';

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({super.key, required this.title});
  final String title;

  @override
  State<AddExpenseView> createState() => _AddExpenseView();
}


class _AddExpenseView extends State<AddExpenseView> {


  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
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
              alignment: Alignment(0, -0.45),
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
            alignment: Alignment(0,0.6),
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
              ),
            ),
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