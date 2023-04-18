import 'dart:core';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../Model/Purchase.dart';
import '../Model/User.dart';
import 'EditExpenseView.dart';


class PurchaseList extends StatefulWidget {
  User user;
  PurchaseList({super.key, required this.title, required this.user});
  final String title;

  @override
  State<PurchaseList> createState() => _PurchaseList();
}


class _PurchaseList extends State<PurchaseList>  {

  final List<Purchase> purchases = [
    Purchase(10, "a minha linha de dois", "Leisure", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023)),
    Purchase(11, "bleh", "Education", 0, DateTime(2023))


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.user.purchases.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditExpenseView(title: "Edit Expense", purchase: purchases[index], user: widget.user,)),
                );
              },
              child: ListTile(
                title: Text(widget.user.purchases[index].category),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amount: ${widget.user.purchases[index].amount.toString()}"),
                    Text("Description: ${widget.user.purchases[index].description}"),
                  ],
                ),
                trailing: Text(widget.user.purchases[index].datetime.toString()),
              )
          );

        },
      ),
    );
  }


}
