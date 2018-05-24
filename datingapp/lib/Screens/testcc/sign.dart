import 'package:flutter/material.dart';

class Loginsign extends StatefulWidget {
  @override
  _LoginsignState createState() => new _LoginsignState();
}

class _LoginsignState extends State<Loginsign> {
  DecorationImage img;
  @override
  void initState() {
    super.initState();
    img = new DecorationImage(
      image: new ExactAssetImage('assets/bg.png'),
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      body: new Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: new BoxDecoration(image: img),
      ),
    );
  }
}
