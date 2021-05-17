import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vierra/screens/landingpage.dart';
import 'package:vierra/screens/landingpage.dart';
import 'package:vierra/screens/search.dart';


// Floating Button
class FloatingButton extends StatelessWidget {
  final String bodySelected;
  FloatingButton(this.bodySelected);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.yellowAccent[700],
      child: Icon(Icons.search,color: Colors.grey[900],),
      onPressed: () {
        //floating action search
        Navigator.pushReplacement(
            context,MaterialPageRoute(builder: (context) => Search(bodySelected))
        );
      },
    );
  }
}


class DrawerOpen extends StatefulWidget {
  @override
  _DrawerOpenState createState() => _DrawerOpenState();
}

//Drawer
class _DrawerOpenState extends State<DrawerOpen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    }catch (e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Container(
        color: Colors.grey[700],
        child: new ListView(
          children: [
            //header
            new UserAccountsDrawerHeader(
              accountEmail: Text(loggedInUser.email,style: TextStyle(color: Colors.yellowAccent[700])),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.yellowAccent[700],
                  child: Icon(Icons.person,color: Colors.grey[900],),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.grey[900]
              ),
            ),
            //body

            InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, 'home_screen');
              },
              child: ListTile(
                title: Text('Home Page',style: TextStyle(color: Colors.yellowAccent[700])),
                leading: Icon(Icons.home,color: Colors.grey[300]),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My account',style: TextStyle(color: Colors.yellowAccent[700])),
                leading: Icon(Icons.person,color: Colors.grey[400],),
              ),
            ),
            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings',style: TextStyle(color: Colors.yellowAccent[700])),
                leading: Icon(Icons.settings,color: Colors.grey[900],),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About',style: TextStyle(color: Colors.yellowAccent[700])),
                leading: Icon(Icons.help,color: Colors.blue,),
              ),
            ),
            InkWell(
              onTap: (){
                _auth.signOut();
                Navigator.popAndPushNamed(context, 'welcome_screen');
              },
              child: ListTile(
                title: Text('Log Out',style: TextStyle(color: Colors.yellowAccent[700])),
                leading: Icon(Icons.person,color: Colors.grey[900],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Stream List
class StreamList extends StatefulWidget {
  final String collect;
  StreamList(this.collect);

  @override
  _StreamListState createState() => _StreamListState();
}

class _StreamListState extends State<StreamList> {
  @override
  Widget build(BuildContext context) {
    routeToDetail(DocumentSnapshot info) {
      Navigator.pushReplacement(
        context,MaterialPageRoute(builder: (context) => Detail(info: info,))
      );
    }
    return Container(
      height: 150.0,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection(widget.collect).snapshots(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data.docs.map((document) {
              return GestureDetector(
                onTap: () => routeToDetail(document),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(document['url']),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

// Stream Carousel
class StreamCarousel extends StatefulWidget {
  @override
  _StreamCarouselState createState() => _StreamCarouselState();
}

class _StreamCarouselState extends State<StreamCarousel> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('carousel').snapshots(),
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
        if(!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return CarouselSlider(
          items: snapshot.data.docs.map((document) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(document['url']),
                    fit: BoxFit.cover,
                  )
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16/9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),);
      },
    );
  }
}

//stream Name

class StreamName extends StatelessWidget {
  final String name;
  StreamName(this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(name,style: TextStyle(color: Colors.grey[200]),),
    );
  }
}







