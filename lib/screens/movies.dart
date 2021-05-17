import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vierra/screens/landingpage.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    routeToDetail(DocumentSnapshot info) {
      Navigator.pushReplacement(
          context,MaterialPageRoute(builder: (context) => Detail(info: info,bodySelected: 'movies',))
      );
    }

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('movies').snapshots(),
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.count(
          crossAxisCount: 3,
          children: snapshot.data.docs.map((document) {
            return GestureDetector(
              onTap: () => routeToDetail(document),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 2.0),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(document['url']),
                      fit: BoxFit.fill),
                    ),
                  ),
                )
              ),
            );
          }).toList(),
        );
      },

    );
  }
}


