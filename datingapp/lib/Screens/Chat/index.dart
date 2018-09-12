import 'package:datingapp/Screens/Chat/styles.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => new _ChatState();
}

class _ChatState extends State<Chat> {
  TabController controller;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
        appBar: new AppBar(
          elevation: 1.0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: new Text(
            "Matches",
            style: new TextStyle(
                color: new Color.fromRGBO(92, 107, 122, 1.0), fontSize: 32.0),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        body: new Container(
            width: screenSize.width,
            height: screenSize.height,
            color: const Color.fromRGBO(239, 239, 245, 1.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  height: 100.0,
                  width: 100.0,
                  decoration:
                      new BoxDecoration(shape: BoxShape.circle, image: logo),
                ),
                new Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: new Text(
                    "There are no matches!",
                    style: new TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15.0,
                        fontWeight: FontWeight.w100,
                        letterSpacing: 1.0),
                  ),
                )
              ],
            )));
  }
}
