import 'package:flutter/material.dart';
import 'Model/User.dart';
import 'View/HomePageView.dart';

void main() {

  //User temp = new User("200", "232", [], [], []);
  //print(temp.username);
  //print(temp.id);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    User user = User(id: "oi", username: "Alan Turing", habits: [], posts: []
    , customCategories: [], purchases: []);
    user.addPurchase(100, "i wanted", "food", 0);
    user.addPurchase(25, "for jhdv", "leisure", 2);
    return MaterialApp(
      title: 'MoneyWatch',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(title: 'MoneyWatch', user: user),
    );
  }
}