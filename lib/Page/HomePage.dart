import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_resume/Widget/bottomNavigationStyle.dart';
import 'package:pro_resume/Widget/sideNavigationStyle.dart';

import '../Constants/StringConstants.dart';

class CompleteHomePage extends StatefulWidget {
  const CompleteHomePage({Key? key}) : super(key: key);

  static _CompleteHomePageState? of(BuildContext context) =>
      context.findAncestorStateOfType<_CompleteHomePageState>();

  @override
  _CompleteHomePageState createState() => _CompleteHomePageState();
}

enum NavigationStyle { sideNavigation, bottomNavigation }

class _CompleteHomePageState extends State<CompleteHomePage> {
  var navigationDrawerStyle = NavigationStyle.sideNavigation;
  int preSelectedTabNumber = -1;
  var breakpoint = 1000;
  var noDisplayBreakpoint = 370;

  void changeNavigationStyle(int styleNumber, int tabSelected) {
    if (styleNumber == 0) {
      navigationDrawerStyle = NavigationStyle.sideNavigation;
    } else {
      navigationDrawerStyle = NavigationStyle.bottomNavigation;
    }

    setState(() {
      navigationDrawerStyle = navigationDrawerStyle;
      preSelectedTabNumber = tabSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (navigationDrawerStyle == NavigationStyle.sideNavigation &&
        screenWidth > breakpoint) {
      return SideNavigationBar(
        preSelectedTabIndex: preSelectedTabNumber,
      );
    } else {
      if (screenWidth > noDisplayBreakpoint) {
        return HomePage(
          preSelectedIndex: preSelectedTabNumber,
        );
      } else {
        return const Scaffold(
          body: Center(
            child: Text(
              unsupportedDisplayMessage,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    }
  }
}
