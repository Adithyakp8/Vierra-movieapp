import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vierra/screens/homescreen.dart';
import 'package:vierra/screens/video.dart';
class Detail extends StatefulWidget {
  final DocumentSnapshot info;
  final String bodySelected;
  Detail({this.info,this.bodySelected});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: SizedBox(
                        height: 400,
                        width: 200,
                        child: Image.network(widget.info['url']),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.info['name'],
                          style: TextStyle(
                            color: Colors.yellowAccent[700],
                            fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                      child: Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: FlatButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => Videoplayer(videoData: widget.info['trailer'],),
                            ));
                          },
                          icon: Icon(Icons.play_arrow,color: Colors.yellowAccent[700],),
                          label: Text('play',style: TextStyle(color: Colors.yellowAccent[700]),),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.info['url']),
                      fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken)
                  ),
                ),
              ),
            ),
            expandedHeight: 900.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.yellowAccent[700],),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
