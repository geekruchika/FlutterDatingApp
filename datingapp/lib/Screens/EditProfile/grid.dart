import 'dart:async';
import 'dart:io';

class GridImage {
  Future<File> imageFile;
  GridImage({
    this.imageFile,
  });
}

class DataListBuilder {
  List<GridImage> gridData = new List<GridImage>();

  GridImage row1 = new GridImage(
    imageFile: null,
  );
  GridImage row2 = new GridImage(
    imageFile: null,
  );
  GridImage row3 = new GridImage(
    imageFile: null,
  );
  GridImage row4 = new GridImage(
    imageFile: null,
  );
  GridImage row5 = new GridImage(
    imageFile: null,
  );
  GridImage row6 = new GridImage(
    imageFile: null,
  );
  GridImage row7 = new GridImage(
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
