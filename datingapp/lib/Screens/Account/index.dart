import 'package:datingapp/Screens/Account/styles.dart';
import 'package:datingapp/theme/styles.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        backgroundColor: Colors.white,
        title: new Text(
          "Account",
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
              height: 80.0,
              width: 80.0,
              decoration:
                  new BoxDecoration(shape: BoxShape.circle, image: logo),
            ),
            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Text(
                "Robert Downey, 21",
                style: new TextStyle(
                    fontFamily: "PoppinsMedium",
                    fontSize: 20.0,
                    //fontWeight: FontWeight.bold,
                    letterSpacing: 0.8),
              ),
            ),
            new Text(
              "American Actor",
              style: new TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15.0,
                  fontWeight: FontWeight.w100,
                  letterSpacing: 0.7),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/settings");
              },
              child: new Container(
                  width: 200.0,
                  height: 50.0,
                  margin: new EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  padding: new EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [gradientOne, gradientTwo, gradientThree],
                        tileMode: TileMode.repeated,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0))),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      new Text(
                        "Settings",
                        style: new TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 0.6,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/profile");
              },
              child: new Container(
                  width: 200.0,
                  height: 50.0,
                  margin: new EdgeInsets.only(top: 24.0),
                  alignment: Alignment.center,
                  padding: new EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [gradientOne, gradientTwo, gradientThree],
                        tileMode: TileMode.repeated,
                      ),
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(50.0))),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      new Text(
                        "Edit Profile",
                        style: new TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 0.6,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
