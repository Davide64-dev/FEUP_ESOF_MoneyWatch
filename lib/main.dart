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

  //WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


// Check if Firestore is initialized
  if (FirebaseFirestore.instance.settings == null) {
    print('Firestore is not yet initialized.');
  } else {
    print('Firestore is already initialized.');
  }

  DocumentReference docRef = FirebaseFirestore.instance.collection('Users').doc('argQUZxJx7xHNtPKfl4N');

  // Get the document data
  DocumentSnapshot snapshot = await docRef.get();
  if (snapshot.exists) {
    // Print the document data
    print(snapshot.data());
  } else {
    print('Document does not exist');
  }

  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User(id: "oi", username: "Alan Turing", habits: [], posts: []
    , customCategories: [], purchases: []);
    user.addPurchase(100, "i wanted", "food", 0);
    user.addPurchase(25, "for jhdv", "leisure", 2);
    user.addPurchase(213, "vds", "leisure", 0);
    return MaterialApp(
      title: 'MoneyWatch',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(title: 'MoneyWatch', user: user),
    );
  }
}