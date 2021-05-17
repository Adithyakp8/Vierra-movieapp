import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 100.0,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                Text(
                  'Vierra',
                  style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.yellowAccent[700]
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.yellowAccent[700],
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    // go to login screen
                    Navigator.pushNamed(context, 'login_screen');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text('Log In'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.yellowAccent[700],
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    // go to register screen
                    Navigator.pushNamed(context, 'register_screen');
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text('Register'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

