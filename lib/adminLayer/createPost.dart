import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  
  TextEditingController dept = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController expo = TextEditingController();
  TextEditingController degree = TextEditingController();

  CollectionReference collectionReference;
  DocumentReference user;
  List<DocumentSnapshot> noticeList;
  StreamSubscription<QuerySnapshot> subscription;

  String doc_dept;
  String doc_id;
  String document_id;
  String doc_name;
  String doc_days;
  String doc_expo;
  String doc_degree;

  @override
  void initState() {
    super.initState();
    collectionReference = Firestore.instance.collection("Cardiology");
    subscription = collectionReference.snapshots().listen((data) {
      setState(() {
        noticeList = data.documents;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  void uploadnotice(){

    doc_dept = dept.text;
    document_id = id.text;
    doc_name = name.text;
    doc_days = days.text;
    doc_expo = expo.text;
    doc_degree = degree.text;

    Map<String,String> noticeData = <String,String>{
      "days":doc_days,
      "degree":"MBBS",
      "expo":doc_expo,
      "id":document_id,
      "name": doc_name,
      "degree" : doc_degree,
    };
    DocumentReference user = Firestore.instance
            .document("$doc_dept/${doc_dept}_$document_id");
    user.setData(noticeData).whenComplete((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Layer"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.red,
        padding: EdgeInsets.all(10.0),
        child: noticeList!=null?ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          clipBehavior: Clip.hardEdge,
                  child: Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.white,
            child: Form(
              child: ListView(
                children: <Widget>[
                  Divider(height: 100.0,),
                  Column(
                    children: <Widget>[
                      TextFormField(
                        controller: dept,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Department",
                            hintText: "Cardiology Orthopedic Opthalmology Nurology Darmotology",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 4.0))),
                      ),
                      Divider(),
                      TextFormField(
                        controller: id,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Doctor Id",
                            hintText: "Previous id was  ${noticeList[noticeList.length-1]["id"]}",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 4.0))),
                      ),
                      Divider(),
                      TextFormField(
                        controller: name,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Doctor Name",
                            hintText: "ABC DEF",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 4.0))),
                      ),
                      Divider(),
                      Divider(),
                      TextFormField(
                        controller: days,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Available Days",
                            hintText: "Mon Wed Fri",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 4.0))),
                      ),
                      Divider(),
                      TextFormField(
                        controller: degree,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Degree",
                            hintText: "MBBS",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 4.0))),
                      ),
                      Divider(),
                      TextFormField(
                        controller: expo,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Previous Experience",
                            hintText: "XYZ Hospital",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 4.0))),
                      ),
                      Divider(height: 100.0,),
                      RaisedButton(
                        child: Text("Upload"),
                        onPressed: uploadnotice
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ):Container(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
          ),
        )
      ),
    );
  }
}