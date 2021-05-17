import 'package:flutter/material.dart';

dynamic lrDecorations = InputDecoration(
  hintText: 'Enter your value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellowAccent[700],width: 1.0),
    borderRadius: BorderRadius.all((Radius.circular(32.0))),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellowAccent[700],width: 1.0),
    borderRadius: BorderRadius.all((Radius.circular(32.0))),
  ),
);
