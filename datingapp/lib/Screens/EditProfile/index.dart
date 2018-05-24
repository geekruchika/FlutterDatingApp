import 'dart:async';
import 'dart:io';

import 'package:datingapp/Components/profileImages.dart';
import 'package:datingapp/Screens/EditProfile/grid.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => new _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Future<File> _imageFile;

  DataListBuilder dataListBuilder = new DataListBuilder();
  getImage(int index) {
    List<GridImage> list = dataListBuilder.gridData;
    if (list[index].imageFile != null) {
      list[index].imageFile = null;
      setState(() {
        _imageFile = null;
      });
    } else {
      _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);

      _imageFile.then((onValue) {
        print(onValue);
        if (onValue != null) {
          list[index].imageFile = _imageFile;
          setState(() {
            _imageFile = null;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<GridImage> list = dataListBuilder.gridData;
    return new Scaffold(
      appBar: new AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: new Text(
          "Edit Profile",
          style: new TextStyle(
              color: new Color.fromRGBO(92, 107, 122, 1.0),
              fontSize: 25.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child:
                new Image(image: new ExactAssetImage("assets/back-arrow.png"))),
        automaticallyImplyLeading: true,
      ),
      body: new SingleChildScrollView(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text(
                    "Photos",
                    style: new TextStyle(
                        fontSize: 20.0, fontFamily: "PoppinsRegular"),
                  ),
                ),

                // new Container(
                //   height: 500.0,
                //   child: new StaggeredGridView.countBuilder(
                //     crossAxisCount: 4,
                //     itemCount: list.length,
                //     itemBuilder: (BuildContext context, int index) =>
                //         new ProfileImage(
                //           margin: 0.0,
                //           width: list[index].width,
                //           height: list[index].height,
                //           numtext: index.toString(),
                //           imageFile: list[index].imageFile,
                //           iconOnClick: () {
                //             getImage(index);
                //           },
                //         ),
                //     staggeredTileBuilder: (int index) =>
                //         new StaggeredTile.extent(2, 150.0),
                //     mainAxisSpacing: 4.0,
                //     crossAxisSpacing: 4.0,
                //   ),
                // ) //

                new Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new ProfileImage(
                      margin: 10.0,
                      width: 200.0,
                      height: 280.0,
                      numtext: "1",
                      imageFile: list[0].imageFile,
                      iconOnClick: () {
                        getImage(0);
                      },
                    ),
                    new Column(
                      children: <Widget>[
                        new ProfileImage(
                          margin: 10.0,
                          width: 90.0,
                          height: 130.0,
                          numtext: "2",
                          imageFile: list[1].imageFile,
                          iconOnClick: () {
                            getImage(1);
                          },
                        ),
                        new ProfileImage(
                          margin: 10.0,
                          width: 90.0,
                          height: 130.0,
                          numtext: "3",
                          imageFile: list[2].imageFile,
                          iconOnClick: () {
                            getImage(2);
                          },
                        ),
                      ],
                    )
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new ProfileImage(
                      margin: 10.0,
                      width: 90.0,
                      height: 130.0,
                      numtext: "6",
                      imageFile: list[5].imageFile,
                      iconOnClick: () {
                        getImage(5);
                      },
                    ),
                    new ProfileImage(
                      margin: 10.0,
                      width: 90.0,
                      height: 130.0,
                      numtext: "5",
                      imageFile: list[4].imageFile,
                      iconOnClick: () {
                        getImage(4);
                      },
                    ),
                    new ProfileImage(
                      margin: 10.0,
                      width: 90.0,
                      height: 130.0,
                      numtext: "4",
                      imageFile: list[3].imageFile,
                      iconOnClick: () {
                        getImage(3);
                      },
                    ),
                  ],
                )
              ])),
    );
  }
}
