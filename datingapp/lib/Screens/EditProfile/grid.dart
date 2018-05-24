import 'dart:async';
import 'dart:io';

class GridImage {
  double margin;
  double width;
  double height;

  Future<File> imageFile;
  GridImage({this.height, this.imageFile, this.margin, this.width});
}

class DataListBuilder {
  List<GridImage> gridData = new List<GridImage>();

  GridImage row1 = new GridImage(
    margin: 10.0,
    width: 200.0,
    height: 280.0,
    imageFile: null,
  );
  GridImage row2 = new GridImage(
    margin: 10.0,
    width: 90.0,
    height: 130.0,
    imageFile: null,
  );
  GridImage row3 = new GridImage(
    margin: 10.0,
    width: 90.0,
    height: 130.0,
    imageFile: null,
  );
  GridImage row4 = new GridImage(
    margin: 10.0,
    width: 90.0,
    height: 130.0,
    imageFile: null,
  );
  GridImage row5 = new GridImage(
    margin: 10.0,
    width: 90.0,
    height: 130.0,
    imageFile: null,
  );
  GridImage row6 = new GridImage(
    margin: 10.0,
    width: 90.0,
    height: 130.0,
    imageFile: null,
  );
  GridImage row7 = new GridImage(
    margin: 10.0,
    width: 90.0,
    height: 130.0,
    imageFile: null,
  );

  DataListBuilder() {
    gridData.add(row1);
    gridData.add(row2);
    gridData.add(row3);
    gridData.add(row4);
    gridData.add(row5);
    gridData.add(row6);
    gridData.add(row7);
  }
}
