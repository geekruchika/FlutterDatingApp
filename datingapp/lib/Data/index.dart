import 'package:datingapp/Data/styles.dart';
import 'package:flutter/material.dart';

final otherUsersData = [
  new DataViewModel(user1, 10.0, "Long description", "Tom Cruise",
      "Short description", "Paris pvt ltd", "male"),
  new DataViewModel(user2, 10.0, "Long description", "Harry Potter",
      "Short description", "Paris pvt ltd", "male"),
  new DataViewModel(user3, 10.0, "Long description", "Richa Methew",
      "Short description", "Paris pvt ltd", "male"),
  new DataViewModel(user4, 10.0, "Long description", "Ronaldo",
      "Short description", "Paris pvt ltd", "male")
];

class OtherUser extends StatelessWidget {
  final DataViewModel viewModel;

  OtherUser({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[],
    );
  }
}

class DataViewModel {
  final String name;
  final String shortDescription;
  final String workPlace;
  final String gender;
  final double distance;
  final String longDescription;
  final DecorationImage img;

  DataViewModel(this.img, this.distance, this.longDescription, this.name,
      this.shortDescription, this.workPlace, this.gender);
}
