import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Model/User.dart';
import 'View/HomePageView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'View/LoginView.dart';

Future main() async{
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyWatch',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MainPage(),
    );
  }
}


class MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
      body: StreamBuilder<auth.User?>(
          stream: auth.FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final user = auth.FirebaseAuth.instance.currentUser;
              User user1 = User(
                id: user!.uid,
                email: user!.email,
                username: user.displayName ?? "",
                habits: [],
                posts: [],
                customCategories: [],
                purchases: [],
              );
              return HomePage(title: 'MoneyWatch', user: user1);

            } else{
              return LoginView(title: "Login");
            }
          }
      )
  );}
