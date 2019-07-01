import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class UploadData {

  String id;
  String name;
  String degree;
  String days;
  String expo;

  UploadData(this.id,this.name,this.degree,this.days,this.expo);

  CollectionReference collectionReference;
  DocumentReference user;
  List<DocumentSnapshot> noticeList;
  StreamSubscription<QuerySnapshot> subscription;

  uploadnotice(){

    Map<String,String> noticeData = <String,String>{
      "days":this.days,
      "degree": this.degree,
      "expo": this.degree,
      "id": this.id,
      "name": this.name,
      "degree" : this.degree,
    };

    DocumentReference user = Firestore.instance
            .document("Cardiology/Cardiology_${this.id}");
    user.setData(noticeData).whenComplete((){
      print(this.id);
    });
   }
}