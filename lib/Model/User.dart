import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../View/StatisticsPageView.dart';
import 'Budget.dart';
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
  List<Budget> budgets = [Budget(42.42, 'Leisure')];
  String email = "";

  User({required this.id, required this.username,required this.habits, required
    this.posts, required this.customCategories, required this.purchases, required email}) {
    //if (id == '') {
      //throw ArgumentError('id cannot be empty');
    //
    //if (username == '') {
    //  throw ArgumentError('username cannot be empty');
    //}
  }

  void setEmail(String email){
    this.email = email;
  }
  factory User.fromFirestore(DocumentSnapshot value){
    Map<String, dynamic> data = value.data() as Map<String, dynamic>;
    return User(
      email: data["email"],
      username: data["username"],
      habits: [],
      posts: [],
      customCategories: [],
      purchases: [], id: ''
    );
  }



  void addExpenses() async{
    CollectionReference users = FirebaseFirestore.instance.collection('Purchase');
    QuerySnapshot snapshot1 = await users.where('user', isEqualTo: email).get();
    addExpensesWithSnapshot(snapshot1);
  }

  void addExpensesWithSnapshot(QuerySnapshot value){
    value.docs.forEach((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String id = doc.id;
      double amount = data["amount"].toDouble();
      String category = data["category"];
      String description = data["description"];
      int nr_days = data["nr_days"];
      DateTime datetime = DateTime.parse(data["datetime"]);
      addPurchase(id, amount, description, category, nr_days, datetime);
    });
  }

  void addHabit(String title, String description, DateTime startdate, double amountperday){
    Habit habit = Habit(title, description, startdate, amountperday);
    habits.add(habit);
    habits.sort();
    habits = habits.reversed.toList();
  }

  static void addUsertoDatabase(String name, String email, String username){
    FirebaseFirestore.instance.collection('Users').add({
      'name': name,
      'email':email,
      'username': username,
    });
  }

  void addPosttoDatabase(String title, String content, String topic){
    FirebaseFirestore.instance.collection('Posts').add({
      'category': topic,
      'content': content,
      'title': title,
      'user': this.username
    });
  }

  void addHabittoDatabase(String title, String description, DateTime startdate, double amountperday){
    Habit habit = Habit(title, description, startdate, amountperday);
    FirebaseFirestore.instance.collection('Habits').add({
      'title': title,
      'description': description,
      'date': startdate.toString(),
      'amount': amountperday,
      'user': email,
    }).then((newDocRef) {
      String docId = newDocRef.id;
      print('New document added with ID: $docId');
      //habit.setId(docId);
      habits.add(habit);
      habits.sort();
      habits = habits.reversed.toList();
    });;
  }

  void addBudgettoDatabase(String category, double amount){
    FirebaseFirestore.instance.collection('Budgets').add(
      {
        'category': category,
        'amount': amount,
        'user': this.email,
      }
    );
    budgets.add(Budget(amount, category));
  }


  void addPurchase(String id, double amount, String description, String category, nr_days, DateTime datetime){
    Purchase purchase = Purchase(id, amount, description, category, nr_days, datetime);
    purchases.add(purchase);
    purchases.sort();
    purchases = purchases.reversed.toList();
  }

  void removePurchasetoDatabase(String ID){
    CollectionReference purchasesRef = FirebaseFirestore.instance.collection('Purchase');
    purchasesRef.doc(ID).delete().then((value) {
      print('Document with ID $ID has been deleted');
      purchases.removeWhere((purchase) => purchase.getId() == ID);
    }).catchError((error) {
      print('Error deleting document with ID $ID: $error');
    });
  }

  void removeHabittoDatabase(String name){
    CollectionReference habitsRef = FirebaseFirestore.instance.collection('Habit');
    habitsRef.doc(name).delete().then((value) {
      print('Document with name $name has been deleted');
      habits.removeWhere((habit) => habit.getName() == name);
    }).catchError((error) {
      print('Error deleting document with name $name: $error');
    });
  }

  void addPurchasetoDatabase(double amount, String description, String category, nr_days, DateTime datetime){
    Purchase purchase = Purchase(" ",amount, description, category, nr_days, datetime);
    FirebaseFirestore.instance.collection('Purchase').add({
      'amount': amount,
      'category': category,
      'datetime': datetime.toString(),
      'nr_days': nr_days,
      'description': description,
      'user': email,
    }).then((newDocRef) {
      String docId = newDocRef.id;
      print('New document added with ID: $docId');
      purchase.setId(docId);
      purchases.add(purchase);
      purchases.sort();
      purchases = purchases.reversed.toList();
    });;
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

  Map<String, double> getPurchasesMTD(Budget budget){
    Map<String, double> ret = {};
    for (Purchase purchase in purchases){
      if (purchase.category != budget.category) continue;
      else{
        if (isInCurrentMonth(purchase.datetime)){
          if (ret[budget.category] == null){
            ret[budget.category] = purchase.amount.toDouble();
          }
          else{
            ret[budget.category] = ret[budget.category]! + purchase.amount.toDouble()!;
          }
        }
      }
    }
    if (ret[budget.category] == null){
      ret[budget.category] = 0;
    }
    ret["not spent"] = budget.amount - ret[budget.category]!;
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

bool isInCurrentMonth(DateTime date) {
  // Get the current month and year
  DateTime now = DateTime.now();
  int currentMonth = now.month;
  int currentYear = now.year;

  // Check if the given date's month and year match the current month and year
  return (date.month == currentMonth && date.year == currentYear);
}