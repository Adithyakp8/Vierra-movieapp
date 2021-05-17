
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vierra/components/services.dart';
import 'package:vierra/screens/homescreen.dart';
import 'package:vierra/screens/landingpage.dart';
import 'package:vierra/constants.dart';
class Search extends StatefulWidget {
  final String bodySelected;
  Search(this.bodySelected);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExecuted = false;
  @override
  Widget build(BuildContext context) {
    routeToDetail(DocumentSnapshot info) {
      Navigator.pushReplacement(
          context,MaterialPageRoute(builder: (context) => Detail(info: info,))
      );
    }

    Widget searchedData(){
      return ListView.builder(
        itemCount: snapshotData.docs.length,
        itemBuilder: (BuildContext context,int index) {
          return GestureDetector(
            onTap: () => routeToDetail(snapshotData.docs[index]),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  snapshotData.docs[index].data()['url']
                ),
              ),
              title: Text(snapshotData.docs[index].data()['name'],style: TextStyle(
                color: Colors.yellowAccent[700],fontWeight: FontWeight.bold,fontSize: 15.0
              ),),
            ),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.clear,color: Colors.grey[900],),onPressed: () {
        Navigator.pushReplacement(
            context,MaterialPageRoute(builder: (context) => HomeScreen())
        );
      },
      backgroundColor: Colors.yellowAccent[700],),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          GetBuilder<DataController>(
            init: DataController(widget.bodySelected),
            builder: (val) {
              return IconButton(icon: Icon(Icons.search,color: Colors.yellowAccent[700],), onPressed: () {
                val.queryData(searchController.text.toUpperCase()).then((value) {
                  snapshotData = value;
                  setState(() {
                    isExecuted = true;
                  });
                });
              });
            },
          )
        ],
        title: TextField(
          style: TextStyle(color: Colors.yellowAccent[700]),
          decoration: lrDecorations.copyWith(hintText:widget.bodySelected,hintStyle:TextStyle(color: Colors.yellowAccent[700]),),
          controller: searchController,
        ),
        backgroundColor: Colors.grey[800],
        automaticallyImplyLeading: false,
      ),
      body: isExecuted ? searchedData() : Container(
        child: Center(
          child: Text('search',style: TextStyle(
            color: Colors.yellowAccent[700],fontSize: 30.0
          ),),
        ),
      ),
    );
  }
}

