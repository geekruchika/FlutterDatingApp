import 'package:datingapp/Screens/Home/styles.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => new _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        child: new Text("pop"),
        onTap: () {
          setState(() {
            imageData.remove(imageData[imageData.length - 1]);
          });
        },
      ),
      body: new Stack(
        children: imageData,
      ),
    );
  }
}

List<Widget> imageData = [
  new Container(
    decoration: new BoxDecoration(image: image1),
  ),
  new Container(
    decoration: new BoxDecoration(image: image2),
  ),
  new Container(
    decoration: new BoxDecoration(image: image3),
  ),
  new Container(
    decoration: new BoxDecoration(image: image4),
  ),
  new Container(
    decoration: new BoxDecoration(image: image5),
  )
];
