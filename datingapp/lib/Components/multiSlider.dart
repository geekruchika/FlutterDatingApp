import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';

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
    this.valueIndicatorMaxDecimals: 0,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
  });

  String get lowerValueText =>
      lowerValue.round().toStringAsFixed(valueIndicatorMaxDecimals);
  String get upperValueText =>
      upperValue.round().toStringAsFixed(valueIndicatorMaxDecimals);

  Widget build(BuildContext context, RangeSliderCallback callback) {
    Size screenSize = MediaQuery.of(context).size;
    return new Card(
        elevation: 6.0,
        child: new Container(
            width: screenSize.width,
            padding: new EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: new Column(children: <Widget>[
              new ListTile(
                title: new Text("Age Range"),
                trailing: new Text((lowerValueText) + "-" + (upperValueText)),
              ),
              new Container(
                width: double.infinity,
                child: new Row(
                  children: <Widget>[
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
                            callback(lower, upper);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}
