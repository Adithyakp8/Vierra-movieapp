import 'package:flutter/material.dart';
import 'package:vierra/components/components.dart';

class LiveTv extends StatefulWidget {
  @override
  _LiveTvState createState() => _LiveTvState();
}

class _LiveTvState extends State<LiveTv> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('TEMPORARILY UNAVAILABLE',style: TextStyle(color: Colors.yellowAccent[700],fontWeight: FontWeight.bold,fontSize: 25.0),),
      ),
    );
  }
}
