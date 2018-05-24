import 'dart:async';
import 'dart:io';

import 'package:datingapp/theme/styles.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double margin;
  final double width;
  final double height;
  final String numtext;
  final Function iconOnClick;
  final Future<File> imageFile;
  ProfileImage(
      {this.imageFile,
      this.margin,
      this.width,
      this.height,
      this.numtext,
      this.iconOnClick});

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.all(margin),
          width: width,
          height: height,
          decoration: new BoxDecoration(color: Colors.grey),
          child: new FutureBuilder<File>(
            future: imageFile,
            builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                return new Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    new Image.file(
                      snapshot.data,
                      width: width,
                      height: height,
                      fit: BoxFit.fill,
                    ),
                    new Container(
                      width: 25.0,
                      height: 25.0,
                      margin: new EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: new Text(numtext),
                    ),
                  ],
                );
              } else if (snapshot.error != null) {
                return const Text('error picking image.');
              } else {
                return const Text('');
              }
            },
          ),
        ),
        new InkWell(
          onTap: iconOnClick,
          child: new Container(
            width: 30.0,
            height: 30.0,
            margin: new EdgeInsets.only(top: 20.0),
            alignment: Alignment.center,
            decoration:
                new BoxDecoration(shape: BoxShape.circle, color: gradientThree),
            child: new Icon(
              imageFile == null ? Icons.add : Icons.cancel,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
