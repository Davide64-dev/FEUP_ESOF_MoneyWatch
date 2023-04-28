import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Model/User.dart' as users;


class RegisterView extends StatefulWidget {
  final String title;

  RegisterView({required this.title});

  @override
  _RegisterView createState() => _RegisterView();
}

class _RegisterView extends State<RegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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

                controller: _nameController,
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

                controller: _usernameController,
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
                controller: _emailController,
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
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                  );
                  User? user = userCredential.user;
                  if (user != null) {
                    await user.updateDisplayName(_usernameController.text);
                    await user.updateEmail(_emailController.text);
                  }
                  String email = _emailController.text;
                  String name = _nameController.text;
                  String username = _usernameController.text;
                  users.User.addUsertoDatabase(name, email, username);
                  Navigator.pop(context);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                    _showErrorAdvice("The password provided is too weak");
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                    _showErrorAdvice("The account already exists for that email");
                  }
                  else if (e.code == 'invalid-email'){
                    _showErrorAdvice("The email address is not valid");
                  }
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
