// import 'package:datingapp/theme/styles.dart';
// import 'package:flutter/material.dart';

// class MultiSlider extends StatefulWidget {
//   @override
//   _MultiSliderState createState() => new _MultiSliderState();
// }

// class _MultiSliderState extends State<MultiSlider> {
//   double distance = 0.0;
//   double ageRangeLeft = 0.0;
//   double ageRangeRight = 0.0;

//   Offset dragStart;

//   onDragStart(DragStartDetails details) {
//     dragStart = details.globalPosition;

//     print("dragStart: ${details.globalPosition}");
//   }

//   onDragUpdate(DragUpdateDetails details) {
//     if (dragStart != null) {
//       final newPosition = details.globalPosition;
//       final dx = dragStart.dx - newPosition.dx;
//       print("newPosition ${newPosition.dx}");
//       print("age ${ageRangeLeft}");

//       print(dx);
//       if (dx > 0.0) {
//         setState(() {
//           ageRangeLeft = newPosition.dx;
//         });
//       } else if (dx < 0.0) {
//         setState(() {
//           ageRangeLeft = newPosition.dx;
//         });
//       } else {}
//     }
//   }

//   onDragEnd(DragEndDetails details) {
//     print("dragEnd");
//     final dy = dragStart.dy;
//     dragStart = new Offset(ageRangeLeft, dy);
//   }

//   onDragStart1(DragStartDetails details) {
//     dragStart = details.globalPosition;
//     //print(dragStart);
//   }

//   onDragUpdate1(DragUpdateDetails details) {
//     if (dragStart != null) {
//       final newPosition = details.globalPosition;
//       final dx = dragStart.dx - newPosition.dx;
//       print("newPosition ${newPosition.dx}");
//       print(dx);
//       if (dx > 0.0) {
//         setState(() {
//           ageRangeRight = dx;
//         });
//       } else if (dx < 0.0) {
//         setState(() {
//           ageRangeRight = dx;
//         });
//       } else {}
//     }
//   }

//   onDragEnd1(DragEndDetails details) {
//     print("dragEnd");
//     //final dy = dragStart.dy;
//     //dragStart = new Offset(ageRangeRight, dy);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     return new Scaffold(
//       body: new Column(children: <Widget>[
//         new ListTile(
//           title: new Text("Age Range"),
//           trailing: new Text((ageRangeLeft + 18).round().toString() +
//               "-" +
//               (100 - ageRangeRight).round().toString()),
//         ),
//         new ListTile(
//             enabled: false,
//             title: new Stack(
//               alignment: Alignment.center,
//               children: <Widget>[
//                 new Container(
//                   width: screenSize.width,
//                   height: 25.0,
//                 ),
//                 new Positioned(
//                   //left: 0.0,
//                   child: new Container(
//                     height: 4.0,
//                     width: screenSize.width,
//                     color: Colors.grey,
//                     child: new Row(
//                       children: <Widget>[
//                         new Flexible(
//                           flex: ageRangeLeft.floor(),
//                           child: new Container(),
//                         ),
//                         new Flexible(
//                           flex: 60,
//                           child: new Container(
//                             color: gradientOne,
//                           ),
//                         ),
//                         new Flexible(
//                           flex: ageRangeRight.floor(),
//                           child: new Container(
//                             color: Colors.grey,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 new Positioned(
//                   left: ageRangeLeft,
//                   child: new GestureDetector(
//                     onHorizontalDragStart: onDragStart,
//                     onHorizontalDragUpdate: onDragUpdate,
//                     onHorizontalDragEnd: onDragEnd,
//                     child: new Container(
//                       height: 20.0,
//                       width: 20.0,
//                       decoration: new BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: gradientTwo,
//                       ),
//                     ),
//                   ),
//                 ),
//                 new Positioned(
//                   right: ageRangeRight,
//                   child: new GestureDetector(
//                     onHorizontalDragStart: onDragStart1,
//                     onHorizontalDragUpdate: onDragUpdate1,
//                     onHorizontalDragEnd: onDragEnd1,
//                     child: new Container(
//                       height: 20.0,
//                       width: 20.0,
//                       decoration: new BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: gradientTwo,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )),
//       ]),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RangeSlider Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RangeSliderSample(),
    );
  }
}

class RangeSliderSample extends StatefulWidget {
  @override
  _RangeSliderSampleState createState() => _RangeSliderSampleState();
}

class _RangeSliderSampleState extends State<RangeSliderSample> {
  // List of RangeSliders to use, together with their parameters
  List<RangeSliderData> rangeSliders;

  double _lowerValue = 20.0;
  double _upperValue = 80.0;

  @override
  void initState() {
    super.initState();
    rangeSliders = _rangeSliderDefinitions();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      top: false,
      bottom: false,
      child: new Scaffold(
        appBar: new AppBar(title: new Text('RangeSlider Demo')),
        body: new Container(
          padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
          child: new Column(
              children: <Widget>[]
                // ..add(
                //   //
                //   // Simple example
                //   //
                //   new RangeSlider(
                //     min: 0.0,
                //     max: 100.0,
                //     lowerValue: _lowerValue,
                //     upperValue: _upperValue,
                //     divisions: 5,
                //     showValueIndicator: true,
                //     valueIndicatorMaxDecimals: 1,
                //     onChanged: (double newLowerValue, double newUpperValue) {
                //       setState(() {
                //         _lowerValue = newLowerValue;
                //         _upperValue = newUpperValue;
                //       });
                //     },
                //     onChangeStart:
                //         (double startLowerValue, double startUpperValue) {
                //       print(
                //           'Started with values: $startLowerValue and $startUpperValue');
                //     },
                //     onChangeEnd: (double newLowerValue, double newUpperValue) {
                //       print(
                //           'Ended with values: $newLowerValue and $newUpperValue');
                //     },
                //   ),
                // )
                // // Add some space
                // ..add(
                //   new SizedBox(height: 24.0),
                // )
                //
                // Add a series of RangeSliders, built as regular Widgets
                // each one having some specific customizations
                //
                ..addAll(_buildRangeSliders())),
        ),
      ),
    );
  }

  // -----------------------------------------------
  // Creates a list of RangeSliders, based on their
  // definition and SliderTheme customizations
  // -----------------------------------------------
  List<Widget> _buildRangeSliders() {
    List<Widget> children = <Widget>[];
    for (int index = 0; index < rangeSliders.length; index++) {
      children
          .add(rangeSliders[index].build(context, (double lower, double upper) {
        // adapt the RangeSlider lowerValue and upperValue
        setState(() {
          rangeSliders[index].lowerValue = lower;
          rangeSliders[index].upperValue = upper;
        });
      }));
      // Add an extra padding at the bottom of each RangeSlider
      children.add(new SizedBox(height: 8.0));
    }

    return children;
  }

  // -------------------------------------------------
  // Creates a list of RangeSlider definitions
  // -------------------------------------------------
  List<RangeSliderData> _rangeSliderDefinitions() {
    return <RangeSliderData>[
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 10.0,
          upperValue: 100.0,
          thumbColor: Colors.pink,
          activeTrackColor: Colors.blue,
          inactiveTrackColor: Colors.grey,
          valueIndicatorColor: Colors.black),
      // RangeSliderData(
      //     min: 0.0,
      //     max: 100.0,
      //     lowerValue: 25.0,
      //     upperValue: 75.0,
      //     divisions: 20,
      //     overlayColor: Colors.red[100]),
      // RangeSliderData(
      //     min: 0.0,
      //     max: 100.0,
      //     lowerValue: 10.0,
      //     upperValue: 30.0,
      //     showValueIndicator: false,
      //     valueIndicatorMaxDecimals: 0),
      // RangeSliderData(
      //     min: 0.0,
      //     max: 100.0,
      //     lowerValue: 10.0,
      //     upperValue: 30.0,
      //     showValueIndicator: true,
      //     valueIndicatorMaxDecimals: 0,
      //     activeTrackColor: Colors.red,
      //     inactiveTrackColor: Colors.red[50],
      //     valueIndicatorColor: Colors.green),
      // RangeSliderData(
      //     min: 0.0,
      //     max: 100.0,
      //     lowerValue: 25.0,
      //     upperValue: 75.0,
      //     divisions: 20,
      //     thumbColor: Colors.grey,
      //     valueIndicatorColor: Colors.grey),
    ];
  }
}

class RangeSliderData {
  double min;
  double max;
  double lowerValue;
  double upperValue;
  int divisions;
  bool showValueIndicator;
  int valueIndicatorMaxDecimals;
  bool forceValueIndicator;
  Color overlayColor;
  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color valueIndicatorColor;
  Color activeTickMarkColor;

  static const Color defaultActiveTrackColor = const Color(0xFF0175c2);
  static const Color defaultInactiveTrackColor = const Color(0x3d0175c2);
  static const Color defaultActiveTickMarkColor = const Color(0x8a0175c2);
  static const Color defaultThumbColor = const Color(0xFF0175c2);
  static const Color defaultValueIndicatorColor = const Color(0xFF0175c2);
  static const Color defaultOverlayColor = const Color(0x290175c2);

  RangeSliderData({
    this.min,
    this.max,
    this.lowerValue,
    this.upperValue,
    this.divisions,
    this.showValueIndicator: true,
    this.valueIndicatorMaxDecimals: 1,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
  });

  // Returns the values in text format, with the number
  // of decimals, limited to the valueIndicatedMaxDecimals
  //
  String get lowerValueText =>
      lowerValue.toStringAsFixed(valueIndicatorMaxDecimals);
  String get upperValueText =>
      upperValue.toStringAsFixed(valueIndicatorMaxDecimals);

  // Builds a RangeSlider and customizes the theme
  // based on parameters
  //
  Widget build(BuildContext context, RangeSliderCallback callback) {
    return new Container(
      width: double.infinity,
      child: new Row(
        children: <Widget>[
          new Container(
            constraints: new BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: new Text(lowerValueText),
          ),
          new Expanded(
            child: new SliderTheme(
              data: SliderTheme.of(context).copyWith(
                overlayColor: overlayColor,
                activeTickMarkColor: activeTickMarkColor,
                activeTrackColor: activeTrackColor,
                inactiveTrackColor: inactiveTrackColor,
                thumbColor: thumbColor,
                valueIndicatorColor: valueIndicatorColor,
                showValueIndicator: showValueIndicator
                    ? ShowValueIndicator.always
                    : ShowValueIndicator.onlyForDiscrete,
              ),
              child: new RangeSlider(
                min: min,
                max: max,
                lowerValue: lowerValue,
                upperValue: upperValue,
                divisions: divisions,
                showValueIndicator: showValueIndicator,
                valueIndicatorMaxDecimals: valueIndicatorMaxDecimals,
                onChanged: (double lower, double upper) {
                  // call
                  print(lower);
                  callback(lower, upper);
                },
              ),
            ),
          ),
          new Container(
            constraints: new BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: new Text(upperValueText),
          ),
        ],
      ),
    );
  }
}
