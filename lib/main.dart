import 'package:flutter/material.dart';
import 'Model/User.dart';
import 'View/HomePageView.dart';

void main() {

  User temp = new User("200", "232", [], [], []);
  print(temp.username);
  print(temp.id);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyWatch',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(title: 'MoneyWatch'),
    );
  }
}