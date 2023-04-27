import 'package:MoneyWatch/View/AddExpenseView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  final String title;

  RegisterView({required this.title});

  @override
  _RegisterView createState() => _RegisterView();
}

class _RegisterView extends State<RegisterView> {
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
              alignment: Alignment(0, -0.8),
              child: Image(
                image: AssetImage('assets/login.png'),
                width: 200, // set the width of the image to 200 pixels
                height: 200, // set the height of the image to 200 pixels
                fit: BoxFit.cover,
              )
          ),

          Align(
            alignment: Alignment(0, -0.15),
            child: SizedBox(
              width: 320,
              child: TextField(

                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.greenAccent,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment(0, 0.1),
            child: SizedBox(
              width: 320,
              child: TextField(

                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.greenAccent,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.35),
            child: SizedBox(
              width: 320,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'E-mail',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.greenAccent,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.60),
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
            alignment: Alignment(0, 0.85),
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
              child: Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}