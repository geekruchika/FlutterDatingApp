import 'package:flutter/material.dart';

class ProfileInputs extends StatelessWidget {
  String placeholder;
  int lines;
  String title;
  ProfileInputs({this.lines, this.placeholder, this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text(
              title,
              style:
                  new TextStyle(fontSize: 20.0, fontFamily: "PoppinsRegular"),
            ),
          ),
          new Card(
            elevation: 0.0,
            child: new TextFormField(
              maxLines: lines,
              decoration: new InputDecoration(
                hintText: placeholder,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
