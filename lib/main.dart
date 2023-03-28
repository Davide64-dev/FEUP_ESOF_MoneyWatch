import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model/User.dart';
import 'View/HomePageView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);

  await Firebase.initializeApp();
  DocumentReference docRef = FirebaseFirestore.instance.collection('Users').doc('zo42QzctyWYhHS9kgDVH');
  DocumentSnapshot snapshot = await docRef.get();

  User user = await docRef.get().then((snapshot) => User.fromFirestore(snapshot));
  runApp(MyApp(user: user));
  print(user.username);
}


class MyApp extends StatelessWidget {
  User user;
  MyApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    user.addPurchase(100, "i wanted", "Food", 0);
    user.addPurchase(162, "for jhdv", "Leisure", 0);
    user.addPurchase(213, "vds", "Transport", 0);
    user.addPurchase(232, '2erfd', 'Education', 0);
    return MaterialApp(
      title: 'MoneyWatch',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(title: 'MoneyWatch', user: user),
    );
  }
}