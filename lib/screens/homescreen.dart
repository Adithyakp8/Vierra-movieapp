
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vierra/components/components.dart';
import 'package:vierra/screens/home.dart';
import 'package:vierra/screens/livetv.dart';
import 'package:vierra/screens/movies.dart';
import 'package:vierra/screens/series.dart';

class HomeScreen extends StatefulWidget {
  String bodySelected = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: new AppBar(
        elevation: 1.0,
        title: Text('VIERRA',style: TextStyle(color: Colors.yellowAccent[700]),),
        backgroundColor: Colors.grey[800],
        iconTheme: IconThemeData(color: Colors.yellowAccent[700],size: 200),
      ),
      drawer: DrawerOpen(),
      body: (widget.bodySelected == 'home') ? HomeBody() : (widget.bodySelected == 'live_tv') ? LiveTv(): (widget.bodySelected == 'movies') ? Movies() : Series(),
      // floating and bottom nav
      floatingActionButton: FloatingButton((widget.bodySelected == 'home') ? 'movies' : widget.bodySelected),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.grey[800],
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.bodySelected = 'home';
                  });
                },
                icon: Icon(Icons.home),
                iconSize: 30.0,
                color: (widget.bodySelected == 'home') ? Colors.yellowAccent[700]:Colors.black,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.bodySelected = 'live_tv';
                  });
                },
                icon: Icon(Icons.live_tv),
                iconSize: 30.0,
                color: (widget.bodySelected == 'live_tv') ? Colors.yellowAccent[700]:Colors.black,
              ),
              SizedBox(
                width: 30.0,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.bodySelected = 'movies';
                  });
                },
                icon: Icon(Icons.movie_creation_outlined),
                iconSize: 30.0,
                color: (widget.bodySelected == 'movies') ? Colors.yellowAccent[700]:Colors.black,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.bodySelected = 'series';
                  });
                },
                icon: Icon(Icons.local_movies_sharp),
                color: (widget.bodySelected == 'series') ? Colors.yellowAccent[700]:Colors.black,
                iconSize: 30.0,
              ),
            ],
          ),
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
