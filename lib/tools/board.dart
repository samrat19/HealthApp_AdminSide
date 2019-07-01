import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  String notice;
  String notice_id;
  String date;
  Board(this.notice, this.notice_id, this.date);
  @override
  Widget build(BuildContext context) {
  
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
          child: Card(
        margin: EdgeInsets.all(10.0),
            child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          clipBehavior: Clip.hardEdge,
          child: Container(
              color: Colors.brown[300],
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text("Patient's name : "+
                      notice,
                      style: TextStyle(color: Colors.white, fontSize: 17.0),
                    ),
                  ),
                  Divider(),
                  Text("Doctor's Name : "+notice_id,
                      style:
                          TextStyle(color: Colors.white, fontSize: 17.0)),
                  Divider(),
                  Text("Appointment day : "+
                    date,
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  Divider(),
                ],
              )),
        ),
      ),
    );
  }
}
