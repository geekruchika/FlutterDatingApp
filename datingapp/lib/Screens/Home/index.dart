import 'package:datingapp/Data/index.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
  }

  @override
//  void didChangeAppLifecycleState(AppLifecycleState state) {
//    setState(() {
//      //_lastLifecycleState = state;
//    });
//  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var top = 0.0;
    var left = 0.0;
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: new Text(
          "Discover",
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
          child: new Stack(
              alignment: AlignmentDirectional.topStart,
              children: otherUsersData.map((item) {
                top = top + 10;
                left = left + 10;
                return new Positioned(
                  left: left,
//                  top: top,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        margin: new EdgeInsets.all(20.0),
                        width: 250.0,
                        height: 300.0 + top,
                        decoration: new BoxDecoration(
                            // image: item.img,
                            color: Colors.black,
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(10.0))),
                      ),
                      otherUsersData.indexOf(item) == otherUsersData.length - 1
                          ? new Text(item.name)
                          : new Text("")
                    ],
                  ),
                );
              }).toList())),
    );
  }
}
