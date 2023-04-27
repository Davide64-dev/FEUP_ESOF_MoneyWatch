import 'package:MoneyWatch/View/AddExpenseView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'RegisterView.dart';

class LoginView extends StatefulWidget {
  final String title;

  LoginView({required this.title});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(

        children:[
          Align(
            alignment: Alignment(0, -0.7),
              child: Image(
                image: AssetImage('assets/login.png'),
                width: 250, // set the width of the image to 200 pixels
                height: 250, // set the height of the image to 200 pixels
                fit: BoxFit.cover,
              )
          ),
          Align(
            alignment: Alignment(0, 0.1),
            child: SizedBox(
              width: 320,
            child: TextField(

              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                filled: true, //<-- SEE HERE
                fillColor: Colors.greenAccent,
              ),
            ),
          ),
          ),
            Align(
              alignment: Alignment(0, 0.5),
            child: SizedBox(
              width: 320,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(

                hintText: 'Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                filled: true, //<-- SEE HERE
                fillColor: Colors.greenAccent,
              ),
            ),
            ),
            ),
            Align(
              alignment: Alignment(0, 0.8),
            child: ElevatedButton(
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text
                  );

                } catch (e) {
                  print(e);
                }
              },
              child: Text('Log In'),
            ),
            ),
          Align(
            alignment: Alignment(0, 0.9),
            child: new InkWell(

                child: new Text(
                    'Don\'t have an account? Register here',
                  style: TextStyle(color: Color.fromRGBO(0, 0, 90, 1))
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      RegisterView(title: 'Register')),
                )
            ),

          ),
          ],
        ),
      );
  }
}