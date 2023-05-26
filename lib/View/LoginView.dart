import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              )
          ),
          Align(
            alignment: Alignment(0, 0.1),
            child: SizedBox(
              width: 320,
            child: TextField(
              key: Key("Email"),
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                filled: true,
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
              key: Key("Password"),
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
              alignment: Alignment(0, 0.7),
            child: ElevatedButton(
              key: Key("LoginButton"),
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text
                  );

                } on FirebaseAuthException catch (e) {
                  if(e.code == "user-not-found"){
                    _showErrorAdvice("The user was not found");
                  }

                  else if (e.code == "wrong-password"){
                    _showErrorAdvice("The password is incorrect");
                  }
                  else if (e.code == "invalid-email"){
                    _showErrorAdvice("The email address is not valid");
                  }
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

  void _showErrorAdvice(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
        backgroundColor: Colors.red,
      ),
    );
  }
}