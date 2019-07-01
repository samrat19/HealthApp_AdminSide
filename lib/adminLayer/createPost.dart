import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:moodle/homepage.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController dept = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController days = TextEditingController();
  TextEditingController expo = TextEditingController();
  TextEditingController degree = TextEditingController();

  final snackBar = SnackBar(content: Text("Doctor's Details entered"));

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

  void uploadnotice() {
    doc_dept = dept.text;
    document_id = id.text;
    doc_name = name.text;
    doc_days = days.text;
    doc_expo = expo.text;
    doc_degree = degree.text;

    Map<String, String> noticeData = <String, String>{
      "days": doc_days,
      "degree": doc_degree,
      "expo": doc_expo,
      "id": document_id,
      "name": doc_name,
      "degree": doc_degree,
    };
    DocumentReference user =
        Firestore.instance.document("$doc_dept/${doc_dept}_$document_id");
    user.setData(noticeData).whenComplete(() {
      SnackBar snackBar = SnackBar(content: Text("Upload Success"));
      _scaffoldKey.currentState.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Admin Layer"),
        backgroundColor: Colors.red[900],
      ),
      body: Container(
          color: Colors.red[800],
          padding: EdgeInsets.all(10.0),
          child: noticeList != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    color: Colors.white,
                    child: Form(
                      child: ListView(
                        children: <Widget>[
                          Text(
                            "Enter the Required Information",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.red[800],
                                fontWeight: FontWeight.w800),
                          ),
                          Divider(
                            height: 50.0,
                          ),
                          Column(
                            children: <Widget>[
                              TextFormField(
                                controller: dept,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Department",
                                    hintText:
                                        "Cardiology/Orthopedic/Opthalmology/Nurology/Darmotology",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 4.0))),
                              ),
                              Divider(),
                              TextFormField(
                                controller: id,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Doctor's Id",
                                    hintText:
                                        "Previous id was  ${noticeList[noticeList.length - 1]["id"]}",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 4.0))),
                              ),
                              Divider(),
                              TextFormField(
                                controller: name,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Doctor's Name",
                                    hintText: "ABC DEF",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 4.0))),
                              ),
                              Divider(),
                              TextFormField(
                                controller: days,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Available Days",
                                    hintText: "Mon Wed Fri",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 4.0))),
                              ),
                              Divider(),
                              TextFormField(
                                controller: degree,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Degree",
                                    hintText: "MBBS",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 4.0))),
                              ),
                              Divider(),
                              TextFormField(
                                controller: expo,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    labelText: "Experience",
                                    hintText: "Years of Working",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 4.0))),
                              ),
                              Divider(),
                              Divider(
                                height: 40.0,
                                color: Colors.transparent,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(35.0),
                                child: RaisedButton(
                                    padding: EdgeInsets.all(7.0),
                                    splashColor: Colors.white,
                                    elevation: 50.0,
                                    color: Colors.brown[100],
                                    child: Text(
                                      "Upload",
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    onPressed: uploadnotice),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                )),
    );
  }
}
