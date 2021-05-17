import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vierra/screens/loadingscreen.dart';
import 'package:vierra/constants.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return (showSpinner) ? SpinnerEnable():Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              style: TextStyle(color: Colors.grey),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                // on change do something
                email = value;
              },
              decoration: lrDecorations.copyWith(hintText:'Enter your email'),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              style: TextStyle(color: Colors.grey),
              onChanged: (value) {
                // on change do something
                password = value;
              },
              obscureText: true,
              decoration: lrDecorations.copyWith(hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.yellowAccent[700],
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    //material app on pressed
                    try {
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      setState(() {
                        showSpinner = false;
                      });
                      if (user!= null) {
                        Navigator.pushNamed(context, 'home_screen');
                        setState(() {
                          email = null;
                          password = null;
                        });
                      }
                    }catch(e) {print(e);}
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
