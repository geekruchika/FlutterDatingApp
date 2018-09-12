import 'package:datingapp/Components/swipeButton.dart';

import 'package:flutter/material.dart';

class DummyCard extends StatelessWidget {
  DecorationImage img;
  double bottom;
  double right;
  double left;
  double cardWidth;
  double rotation;
  double skew;
  DummyCard(
      {this.bottom,
      this.cardWidth,
      this.img,
      this.left,
      this.right,
      this.rotation,
      this.skew});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Positioned(
      bottom: 80.0 + bottom,
      child: new Container(
        alignment: Alignment.center,
        width: screenSize.width / 1.2 + cardWidth,
        height: screenSize.height / 1.7,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: new Column(
          children: <Widget>[
            new Container(
              width: screenSize.width / 1.2 + cardWidth,
              height: screenSize.height / 2.2,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(8.0),
                    topRight: new Radius.circular(8.0)),
                image: img,
              ),
            ),
            new Container(
                width: screenSize.width / 1.2 + cardWidth,
                height: screenSize.height / 1.7 - screenSize.height / 2.2,
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
    );
  }
}

Positioned cardDemoDummy(
    DecorationImage img,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;

  return new Positioned(
    bottom: 80.0 + bottom,
    // right: flag == 0 ? right != 0.0 ? right : null : null,
    //left: flag == 1 ? right != 0.0 ? right : null : null,
    child:
        // new Card(
        //   color: Colors.transparent,
        //   elevation: 4.0,
        //   child:
        new Container(
      alignment: Alignment.center,
      width: screenSize.width / 1.2 + cardWidth,
      height: screenSize.height / 1.7,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            width: screenSize.width / 1.2 + cardWidth,
            height: screenSize.height / 2.2,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(8.0),
                  topRight: new Radius.circular(8.0)),
              image: img,
            ),
          ),
          new Container(
              width: screenSize.width / 1.2 + cardWidth,
              height: screenSize.height / 1.7 - screenSize.height / 2.2,
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
    //  ),
  );
}
