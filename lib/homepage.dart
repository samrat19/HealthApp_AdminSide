import 'package:flutter/material.dart';
import 'package:moodle/AppoinmentData/appointmentData.dart';
import 'package:moodle/adminLayer/createPost.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Layer",)),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CreatePost()));
                  },
            child: Text("Enter Doctor's Details"),
          ),
          Divider(),
          RaisedButton(
            onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => NoticeBoard()));
                  },
            child: Text("Check Appointments"),
          )
        ],
      )
    );
  }
}

//ki problem ? ??? prob nei. thakbeo nakhab
