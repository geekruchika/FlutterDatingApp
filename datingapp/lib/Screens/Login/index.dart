import 'dart:async';
import 'dart:convert';

import 'package:datingapp/Screens/Login/pages.dart';
import 'package:datingapp/Screens/Login/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  PageController controller;

  var index = 0;
  bool loader = false;
  String _message = 'Log in/out by pressing the buttons below.';
  // Timer t2;
  // var twenty;
  initState() {
    super.initState();
    controller = new PageController(initialPage: 0, keepPage: true);
  }

  static final FacebookLogin facebookSignIn = new FacebookLogin();
  Future<Null> _login() async {
    setState(() {
      loader = true;
    });
    final FacebookLoginResult result =
        await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        _showMessage('''
         Logged in!
        Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');

        Navigator.of(context).pushNamed("/home");
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  // Future<Null> _logOut() async {
  //   await facebookSignIn.logOut();
  //   _showMessage('Logged out.');
  // }

  void _showMessage(String message) {
    setState(() {
      _message = message;
      print(_message);
      loader = true;
    });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
        body: new Container(
      width: screenSize.width,
      height: screenSize.height,
      padding: new EdgeInsets.all(20.0),
      decoration: new BoxDecoration(image: backgroundImage),
      child: new Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Container(
            width: screenSize.width,
            height: screenSize.height - 200,
            child: new PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (context, index) => new Page(
                    viewModel: pages[index],
                  ),
            ),
          ),
          new Container(
            width: 120.0,
            height: 20.0,
            margin: new EdgeInsets.only(bottom: 20.0),
            child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: pages.map((item) {
                  return new Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: pages[index % 4] == item
                            ? Colors.white
                            : Colors.white70),
                  );
                }).toList()),
          ),
          new FlatButton(
            onPressed: _login,
            child: new Container(
              width: 300.0,
              height: 50.0,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(50.0))),
              child: !loader
                  ? new Text(
                      "Login with Facebook",
                      style: new TextStyle(
                          fontSize: 15.0,
                          letterSpacing: 1.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w100),
                    )
                  : new CircularProgressIndicator(
                      value: null,
                      strokeWidth: 5.0,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
            ),
          ),
          // new RaisedButton(
          //   onPressed: _logOut,
          //   child: new Text("Log out"),
          // )
        ],
      ),
    ));
  }
}

//AnimationController pageController;
//Animation<int> count;
//     pageController = new AnimationController(
//         duration: new Duration(milliseconds: 4000), vsync: this);
//     count = new IntTween(
//       begin: 0,
//       end: 3,
//     ).animate(
//       new CurvedAnimation(
//         parent: pageController,
//         curve: Curves.ease,
//       ),
//     );
//     count.addListener(() {
//       print(count.value);
//       if(count.isCompleted)
//         this.setState((){
//
//           index=0;
//           controller.initialPage;
//           pageController.reset();
//
//         });
//       this.setState(() {
//
//         if (controller.offset != null && index==count.value && index<pages.length) {
//           index++;
//
//
//           controller.animateToPage(index,
//               duration: new Duration(milliseconds: 4000), curve: Curves.ease);
//           // controller.nextPage(
//           //     duration: new Duration(milliseconds: 2000), curve: Curves.ease);
//         }
//       });
//     });
//     //controller.
//
//     pageController.forward();

//    twenty = const Duration(seconds: 4);
//    print(index);
//    t2 = new Timer(twenty, () {
//      setState(() {
//        if (index < pages.length) {
//          index++;
//          controller.animateToPage(index,
//              duration: new Duration(milliseconds: 4000), curve: Curves.ease);
//        } else
//          index = 0;
//      });
//    });
