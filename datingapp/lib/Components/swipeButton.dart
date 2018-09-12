import 'package:datingapp/theme/styles.dart';
import 'package:flutter/material.dart';

class SwipeButton extends StatelessWidget {
  final String text;
  final Function onClick;
  SwipeButton({this.onClick, this.text});
  @override
  Widget build(BuildContext context) {
    return new FlatButton(
        padding: new EdgeInsets.all(0.0),
        onPressed: () {
          onClick();
        },
        child: new Container(
          height: 60.0,
          width: 130.0,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [gradientOne, gradientTwo, gradientThree],
              tileMode: TileMode.repeated,
            ),
            borderRadius: new BorderRadius.circular(60.0),
          ),
          child: new Text(
            text,
            style: new TextStyle(
                fontSize: 18.0,
                letterSpacing: 0.6,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          ),
        ));
  }
}
