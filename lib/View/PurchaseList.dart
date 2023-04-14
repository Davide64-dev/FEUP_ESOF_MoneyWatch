import 'dart:core';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import '../Model/Purchase.dart';
import '../Model/User.dart';


class PurchaseListView extends StatefulWidget {
  User user;
  addPurchase({
    amount = 10,
    description = "a minha linha de dois",
    category = "Leisure",
    nr_days = 1,
    datetime = DateTime({
      year = 2023,
      month = 4,
      day = 1,
      hour = 0,
      minute = 0,
      second = 0,
      millisecond = 0,
      microsecond = 0
    })
  })

  PurchaseListView({super.key, required this.title, required this.user});
  final String title;

  @override
  State<PurchaseListView> createState() => _PurchaseListView();
}


class _PurchaseListView extends State<PurchaseListView>  {

  final List<Purchase> purchases =
}
