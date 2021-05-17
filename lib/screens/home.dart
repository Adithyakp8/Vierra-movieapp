import 'package:flutter/material.dart';
import 'package:vierra/components/components.dart';
class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 15.0,),
        StreamCarousel(),
        SizedBox(height: 20.0,),
        StreamName('TRENDING'),
        SizedBox(height: 5.0,),
        StreamList('trending'),
        SizedBox(height: 10.0,),
        StreamName('FEATURED'),
        SizedBox(height: 5.0,),
        StreamList('featured'),
        SizedBox(height: 10.0,),
        StreamName('MOVIES'),
        SizedBox(height: 5.0,),
        StreamList('movies'),
        SizedBox(height: 10.0,),
        StreamName('SERIES'),
        SizedBox(height: 5.0,),
        StreamList('series'),
        SizedBox(
          height: 15.0,
        ),

      ],
    );
  }
}
