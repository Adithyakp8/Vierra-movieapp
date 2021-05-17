import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class SpinnerEnable extends StatefulWidget {
  @override
  _SpinnerEnableState createState() => _SpinnerEnableState();
}

class _SpinnerEnableState extends State<SpinnerEnable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.yellowAccent[700],
          size: 70.0,
        ),
      ),
    );
  }
}
