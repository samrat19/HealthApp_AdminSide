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
      borderRadius: BorderRadius.circular(20.0),
      clipBehavior: Clip.hardEdge,
      child: Container(
          color: Colors.red,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Text(notice_id,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                      Spacer(),
                      Text(
                        date,
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              Container(
                child: Text(
                  notice,
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              )
            ],
          )),
    );
  }
}
