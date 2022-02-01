import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_resume/Widget/bottomNavigationStyle.dart';
import 'package:pro_resume/Widget/sideNavigationStyle.dart';

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
    if (navigationDrawerStyle == NavigationStyle.sideNavigation) {
      return sideNavigationBar(
        preSelectedTabIndex: preSelectedTabNumber,
      );
    } else {
      return HomePage(
        preSelectedIndex: preSelectedTabNumber,
      );
    }
  }
}
