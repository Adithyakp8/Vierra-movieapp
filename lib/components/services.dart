import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController{
  final String bodySelected;
  DataController(this.bodySelected);
  Future getData(String collection) async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firebaseFirestore.collection(collection).get();
    return snapshot.docs;
  }

  Future queryData(String queryString) async {
    return FirebaseFirestore.instance.collection(bodySelected).where(
      'name',isGreaterThanOrEqualTo: queryString
    ).get();
  }
}

