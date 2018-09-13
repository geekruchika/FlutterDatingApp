import 'package:datingapp/Components/swipeButton.dart';
import 'package:datingapp/Screens/Home/data.dart';
import 'package:datingapp/theme/styles.dart';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';

class DetailPage extends StatefulWidget {
  final DecorationImage type;
  const DetailPage({Key key, this.type}) : super(key: key);
  @override
  _DetailPageState createState() => new _DetailPageState(type: type);
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  AnimationController _containerController;
  Animation<double> width;
  Animation<double> heigth;
  DecorationImage type;
  _DetailPageState({this.type});
  List data = imageData;
  List name = nameData;
  double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  void initState() {
    _containerController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);
    super.initState();
    width = new Tween<double>(
      begin: 200.0,
      end: 220.0,
    ).animate(
      new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth = new Tween<double>(
      begin: 400.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    heigth.addListener(() {
      setState(() {
        if (heigth.isCompleted) {}
      });
    });
    _containerController.forward();
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.7;
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromRGBO(239, 239, 245, 1.0),
        platform: Theme.of(context).platform,
      ),
      child: new Container(
        width: width.value,
        height: heigth.value,
        color: const Color.fromRGBO(239, 239, 245, 1.0),
        child: new Hero(
          tag: "img" + data.indexOf(type).toString(),
          child: new Card(
            margin: new EdgeInsets.all(0.0),
            color: Colors.transparent,
            child: new Container(
              alignment: Alignment.center,
              width: width.value,
              height: heigth.value,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: new Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  new CustomScrollView(
                    shrinkWrap: false,
                    slivers: <Widget>[
                      new SliverAppBar(
                        elevation: 0.0,
                        forceElevated: true,
                        leading: new IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: new Icon(
                            Icons.arrow_back,
                            color: gradientOne,
                            size: 30.0,
                          ),
                        ),
                        expandedHeight: _appBarHeight,
                        pinned: _appBarBehavior == AppBarBehavior.pinned,
                        floating: _appBarBehavior == AppBarBehavior.floating ||
                            _appBarBehavior == AppBarBehavior.snapping,
                        snap: _appBarBehavior == AppBarBehavior.snapping,
                        flexibleSpace: new FlexibleSpaceBar(
                          title: new Text(
                            name[data.indexOf(type)],
                            style: new TextStyle(
                              color: new Color.fromRGBO(92, 107, 122, 1.0),
                              fontSize: 32.0,
                            ),
                          ),
                          background: new Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              new Container(
                                width: width.value,
                                height: _appBarHeight,
                                decoration: new BoxDecoration(
                                  image: data[data.indexOf(type)],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      new SliverList(
                        delegate: new SliverChildListDelegate(<Widget>[
                          new Container(
                            color: Colors.white,
                            child: new Padding(
                              padding: const EdgeInsets.all(35.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    padding: new EdgeInsets.only(bottom: 20.0),
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                        color: Colors.white,
                                        border: new Border(
                                            bottom: new BorderSide(
                                                color: Colors.black12))),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Row(
                                          children: <Widget>[
                                            new Icon(
                                              Icons.sentiment_very_satisfied,
                                              color: gradientOne,
                                            ),
                                            new Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text("25 yrs"),
                                            )
                                          ],
                                        ),
                                        new Row(
                                          children: <Widget>[
                                            new Icon(
                                              Icons.map,
                                              color: gradientOne,
                                            ),
                                            new Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: new Text("15 km"),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 8.0),
                                    child: new Text(
                                      "ABOUT",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  new Text(
                                      "It's party, party, party like a nigga just got out of jail Flyin' in my 'Rari like a bat that just flew outta hell I'm from the east of ATL, but ballin' in the Cali hills Lil mama booty boomin', that bitch movin' and she standin' still I know these bitches choosin' me, but I got 80 on me still. host for the purposes of socializing, conversation, recreation, or as part of a festival or other commemoration of a special occasion. A party will typically feature food and beverages, and often music and dancing or other forms of entertainment.  "),
                                  new Container(
                                    margin: new EdgeInsets.only(top: 25.0),
                                    padding: new EdgeInsets.only(
                                        top: 5.0, bottom: 10.0),
                                    height: 120.0,
                                    decoration: new BoxDecoration(
                                        color: Colors.white,
                                        border: new Border(
                                            top: new BorderSide(
                                                color: Colors.black12))),
                                    child: new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Text(
                                          "INTERESTS",
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Container(
                                              width: 70.0,
                                              height: 30.0,
                                              alignment: Alignment.center,
                                              decoration: new BoxDecoration(
                                                  color: gradientOne,
                                                  borderRadius:
                                                      new BorderRadius.all(
                                                          new Radius.circular(
                                                              30.0))),
                                              child: new Text(
                                                "Movies",
                                                style: new TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            new Container(
                                              width: 70.0,
                                              height: 30.0,
                                              alignment: Alignment.center,
                                              decoration: new BoxDecoration(
                                                  color: gradientOne,
                                                  borderRadius:
                                                      new BorderRadius.all(
                                                          new Radius.circular(
                                                              30.0))),
                                              child: new Text(
                                                "Book",
                                                style: new TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                            new Container(
                                              width: 70.0,
                                              height: 30.0,
                                              alignment: Alignment.center,
                                              decoration: new BoxDecoration(
                                                  color: gradientOne,
                                                  borderRadius:
                                                      new BorderRadius.all(
                                                          new Radius.circular(
                                                              30.0))),
                                              child: new Text(
                                                "Travel",
                                                style: new TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  new Container(
                                    height: 100.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                  new Container(
                      width: 600.0,
                      height: 80.0,
                      decoration: new BoxDecoration(
                        color: const Color.fromRGBO(239, 239, 245, 1.0),
                      ),
                      alignment: Alignment.center,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new SwipeButton(
                            text: "NOPE",
                            onClick: null,
                          ),
                          new SwipeButton(
                            text: "LIKE",
                            onClick: null,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
