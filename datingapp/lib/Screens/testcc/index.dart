import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      body: new Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: new BoxDecoration(
              image: new DecorationImage(
            image: new ExactAssetImage('assets/Background.png'),
            fit: BoxFit.cover,
          )),
          child: new FlatButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed("/sign"),
            child: new Text(
              "click",
              style: new TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          )),
    );
  }
}
