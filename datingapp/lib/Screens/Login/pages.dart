import 'package:datingapp/Screens/Login/styles.dart';
import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(firstPage, "Discover Interesting people around you"),
  new PageViewModel(secondPage, "Swipe Right to like Swipe Left to Pass"),
  new PageViewModel(thirdPage, "If they Swipe Right it's a match"),
  new PageViewModel(fourthPage, "Converse with your match around you")
];

class Page extends StatelessWidget {
  final PageViewModel viewModel;

  Page({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Text(
          viewModel.text,
          style: new TextStyle(
              color: Colors.white, fontSize: 21.0, fontFamily: "Poppins"),
          textAlign: TextAlign.center,
        ),
       new Image(image: viewModel.img),

      ],
    );
  }
}

class PageViewModel {
  final ImageProvider img;
  final String text;
  PageViewModel(this.img, this.text);
}
