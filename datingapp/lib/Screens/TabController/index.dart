import 'package:datingapp/Screens/Chat/index.dart';
import 'package:datingapp/Screens/Home/index.dart';
import 'package:datingapp/Screens/Account/index.dart';
import 'package:datingapp/Screens/TabController/styles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;
  int index = 0;

  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
    controller.addListener(() {
      this.setState(() {
        index = controller.index;
        // print(index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      bottomNavigationBar: new Container(
        height: screenSize.height / 12,
        child: new TabBar(
          tabs: <Tab>[
            // new Tab(
            //   icon: new Icon(
            //     Icons.check_circle_outline,
            //     color: Colors.black,
            //   ),
            // ),
            // new Tab(
            //   icon: new Icon(
            //     Icons.supervised_user_circle,
            //     color: Colors.black,
            //   ),
            // ),
            // new Tab(
            //   icon: new Icon(
            //     Icons.access_time,
            //     color: Colors.black,
            //   ),
            // ),
            new Tab(
              child: new Container(
                width: 30.0,
                height: 30.0,
                decoration: new BoxDecoration(
                    image: index == 0 ? homeColor : homeBlackWhite),
              ),
            ),
            new Tab(
              child: new Container(
                width: 35.0,
                height: 30.0,
                decoration: new BoxDecoration(
                    image: index == 1 ? chatColor : chatBlackWhite),
              ),
            ),
            new Tab(
              child: new Container(
                width: 30.0,
                height: 30.0,
                decoration: new BoxDecoration(
                    image: index == 2 ? accountColor : accountBlackWhite),
              ),
            ),
          ],
          controller: controller,
          indicatorColor: Colors.transparent,
          // unselectedLabelColor: Colors.white30,
        ),
        color: Colors.white,
      ),
      body: new TabBarView(
        children: <Widget>[new HomePage(), new Chat(), new Profile()],
        controller: controller,
      ),
    );
  }
}
