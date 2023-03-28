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

  DocumentReference docRef = FirebaseFirestore.instance.collection('Users').doc('zo42QzctyWYhHS9kgDVH');

  // Get the document data
  DocumentSnapshot snapshot = await docRef.get();
  if (snapshot.exists) {
    // Print the document data
    print(snapshot.data());
    User user = await docRef.get().then((snapshot) => User.fromFirestore(snapshot));
    runApp(MyApp(user: user));
    print(user.username);

  } else {
    print('Document does not exist');
  }

}


class MyApp extends StatelessWidget {
  User user;
  MyApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
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