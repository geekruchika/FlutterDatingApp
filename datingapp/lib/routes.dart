import 'package:datingapp/Screens/EditProfile/index.dart';
import 'package:datingapp/Screens/Settings/index.dart';
import 'package:datingapp/Screens/TabController/index.dart';

import 'package:datingapp/Screens/Login/index.dart';
import 'package:datingapp/multislider.dart';
import 'package:datingapp/test.dart';
import 'package:flutter/material.dart';

class Routes {
  var routes = <String, WidgetBuilder>{
    "/home": (BuildContext context) => new Home(),
    "/settings": (BuildContext context) => new Settings(),
    "/profile": (BuildContext context) => new EditProfile(),
  };
  Routes() {
    runApp(new MaterialApp(
      title: "Flutter Do App",
      debugShowCheckedModeBanner: true,
      home: new Login(),
      routes: routes,
    ));
  }
}
// class MyCustomRoute<T> extends MaterialPageRoute<T> {
//   MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
//       : super(builder: builder, settings: settings);
//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     if (settings.isInitialRoute) return child;
//     return new FadeTransition(opacity: animation, child: child);
//   }
// }
