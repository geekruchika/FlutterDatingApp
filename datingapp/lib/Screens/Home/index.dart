import 'dart:async';
import 'package:datingapp/Screens/Home/activeCard.dart';
import 'package:datingapp/Screens/Home/data.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int flag = 0;

  List data = imageData;
  //List selectedData = [];
  void initState() {
    super.initState();
    //data = data.reversed.toList();
    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          data.removeLast();
          // data.insert(0, i);

          _buttonController.reset();
        }
      });
    });

    right = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  dismissImg(DecorationImage img) {
    setState(() {
      data.remove(img);
    });
  }

  addImg(DecorationImage img) {
    setState(() {
      data.remove(img);
      // selectedData.add(img);
    });
  }

  swipeRight() {
    if (flag == 0)
      setState(() {
        flag = 1;
      });
    _swipeAnimation();
  }

  swipeLeft() {
    if (flag == 1)
      setState(() {
        flag = 0;
      });
    _swipeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;

    double initialBottom = 15.0;
    var dataLength = data.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;
    return (new Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text(
                "Discovers",
                style: new TextStyle(
                  color: new Color.fromRGBO(92, 107, 122, 1.0),
                  fontSize: 32.0,
                ),
              ),
              new Container(
                width: 15.0,
                height: 15.0,
                margin: new EdgeInsets.only(bottom: 20.0),
                alignment: Alignment.center,
                child: new Text(
                  dataLength.toString(),
                  style: new TextStyle(fontSize: 10.0),
                ),
                decoration: new BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
              )
            ],
          ),
        ),
        body: new Container(
          color: const Color.fromRGBO(239, 239, 245, 1.0),
          alignment: Alignment.center,
          child: dataLength > 0
              ? new Stack(
                  alignment: AlignmentDirectional.center,
                  children: data.map((item) {
                    backCardPosition = backCardPosition - 10;
                    backCardWidth = backCardWidth + 10;
                    return new ActiveCard(
                        tag: data.indexOf(item) == dataLength - 1
                            ? "img" + data.indexOf(item).toString()
                            : "noimg" + data.indexOf(item).toString(),
                        img: item,
                        bottom: data.indexOf(item) == dataLength - 1
                            ? bottom.value
                            : backCardPosition,
                        right: data.indexOf(item) == dataLength - 1
                            ? right.value
                            : 0.0,
                        left: 0.0,
                        cardWidth: backCardWidth,
                        rotation: data.indexOf(item) == dataLength - 1
                            ? rotate.value
                            : 0.0,
                        skew: data.indexOf(item) == dataLength - 1
                            ? rotate.value < -10 ? 0.1 : 0.0
                            : 0.0,
                        dismissImg: dismissImg,
                        flag: flag,
                        swipeRight: swipeRight,
                        swipeLeft: swipeLeft);
                  }).toList())
              : new Text("There's no one new around you!",
                  style: new TextStyle(color: Colors.grey, fontSize: 20.0)),
        )));
  }
}
