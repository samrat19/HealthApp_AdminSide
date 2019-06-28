import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController expo = TextEditingController();

  CollectionReference collectionReference;
  DocumentReference user;
  List<DocumentSnapshot> noticeList;
  StreamSubscription<QuerySnapshot> subscription;

  String doc_id;
  String document_id;
  String doc_name;
  String doc_days;
  String doc_expo;

  @override
  void initState() {
    super.initState();
    collectionReference = Firestore.instance.collection("Notice_Board");
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

    document_id = id.text;
    doc_name = name.text;
    doc_days = days.text;
    doc_expo = expo.text;

    Map<String,String> noticeData = <String,String>{
      "doctor name": doc_name,
      "available_days":doc_days,
      "previous_experience":doc_expo
    };
    DocumentReference user = Firestore.instance.document("CardioLogy/$document_id");
    user.setData(noticeData).whenComplete((){
      print("$doc_id  $doc_name $doc_days $doc_expo");
    });
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
                        controller: id,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Doctor Id",
                            hintText: "Previous id was  ${noticeList[noticeList.length-1]["notice_id"]}",
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
                            hintText: "Maintain this type 5th May,2019",
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
                            hintText: "Write the Information",
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
                            hintText: "Write the Information",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 4.0))),
                      ),
                      Divider(height: 100.0,),
                      RaisedButton(
                        child: Text("Done"),
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