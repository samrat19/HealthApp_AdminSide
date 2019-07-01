import 'package:flutter/material.dart';
import 'package:moodle/AppoinmentData/appointmentData.dart';
import 'package:moodle/adminLayer/createPost.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Admin Layer",
          ),
          backgroundColor: Colors.red[800],
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset("asset/logo.png"),
            ),
            Text(
              "For Hospital Authorities' Use Only",
              style: TextStyle(
                  color: Colors.red[800],
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            Divider(
              color: Colors.transparent,
              height: 40.0,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(35.0),
              child: RaisedButton(
                padding: EdgeInsets.all(15.0),
                elevation: 50.0,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => CreatePost()));
                },
                color: Colors.brown[100],
                child: Text(
                  "Enter Doctor's Details",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Divider(height: 30.0,color: Colors.transparent,),
            ClipRRect(
              borderRadius: BorderRadius.circular(35.0),
              child: RaisedButton(
                padding: EdgeInsets.all(15.0),
                elevation: 50.0,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => NoticeBoard()));
                },
                color: Colors.brown[100],
                child: Text(
                  "Check Appointments",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            )
          ],
        ));
  }
}
