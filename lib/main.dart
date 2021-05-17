import 'package:flutter/material.dart';
import 'screens/welcomepage.dart';
import 'screens/register.dart';
import 'screens/login.dart';
import 'screens/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/landingpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: 'welcome_screen',
        routes: {
          'welcome_screen': (context) => WelcomeScreen(),
          'login_screen': (context) => LoginScreen(),
          'register_screen': (context) => RegisterScreen(),
          'home_screen': (context) => HomeScreen(),
          'landing_screen': (context) => Detail(),

        }
    );
  }
}





