import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../View/StatisticsPageView.dart';
import 'Habit.dart';
import 'Post.dart';
import 'Purchase.dart';
import 'dart:core';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'dart:ui';


class User{

  String id = "";
  String username = "";
  List<Habit> habits = [];
  List<Post> posts = [];
  List<String> customCategories = [];
  List<Purchase> purchases = [];

  User({required this.id, required this.username,required this.habits, required
    this.posts, required this.customCategories, required this.purchases}) {
    if (id == '') {
      throw ArgumentError('id cannot be empty');
    }
    if (username == '') {
      throw ArgumentError('username cannot be empty');
    }
  }

  factory User.fromFirestore(DocumentSnapshot value){
    Map<String, dynamic> data = value.data() as Map<String, dynamic>;
    return User(
      username: data["username"],
      habits: [],
      posts: [],
      customCategories: [],
      purchases: [], id: ''
    );
  }

  void addExpenses(QuerySnapshot value){
    value.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      double amount = data["amount"].toDouble();
      String category = data["category"];
      String description = data["description"];
      int nr_days = data["nr_days"];
      DateTime datetime = DateTime.parse(data["datetime"]);
      this.addPurchase(amount, description, category, nr_days, datetime);
    });
  }



  void addPurchase(double amount, String description, String category, nr_days, DateTime datetime){
    Purchase purchase = Purchase(amount, description, category, nr_days, datetime);
    purchases.add(purchase);
    purchases.sort();
    purchases = purchases.reversed.toList();
  }

  void addPurchasetoDatabase(double amount, String description, String category, nr_days, DateTime datetime){
    Purchase purchase = Purchase(amount, description, category, nr_days, datetime);
    FirebaseFirestore.instance.collection('Purchase').add({
      'amount': amount,
      'category': category,
      'datetime': datetime.toString(),
      'nr_days': nr_days,
      'description': description,
      'user': this.username,
    });
    purchases.add(purchase);
    purchases.sort();
    purchases = purchases.reversed.toList();
  }

  void addCustomCategory(String category){
    customCategories.add(category);
  }

  List<String> getCustomCategories(){
    return customCategories;
  }


  Map<String, double> getSumPurchases(DateTime startDate, DateTime endDate){
    Map<String, double> ret = {};
    for (Purchase purchase in purchases) {
      if (isLessThan(startDate, purchase.datetime) &&
          isLessThan(purchase.datetime, endDate)) {
        if (ret[purchase.category] == null) {
          ret[purchase.category] = purchase.amount.toDouble();
        }
        else {
          ret[purchase.category] =
          (ret[purchase.category]! + purchase.amount.toDouble())!;
        }

      }
    }
    if (ret.isEmpty) {
      ret["No Purchases"] = 1;
      return ret;
    }
    return ret;
  }

  List<BarModel> getBarModel(DateTime startDate, DateTime endDate){
    final random = Random();
    List<BarModel> res = [];
    Map<String, double> dic = getSumPurchases(startDate, endDate);
    for (String key in dic.keys){
      res.add(BarModel(category: key, amount: dic[key]!, barColor: charts.ColorUtil.fromDartColor(Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      ))));
    }

    return res;
  }
}

bool isLessThan(DateTime date1, DateTime date2){
  if (date1.year == date2.year){
    if (date1.month == date2.month){
      return date1.day <= date2.day;
    }
    return date1.month <= date2.month;
  }
  return date1.year <= date2.year;
}