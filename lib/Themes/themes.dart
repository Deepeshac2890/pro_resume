import 'package:flutter/material.dart';

darkTheme(context) {
  return ThemeData(
    fontFamily: 'GoogleSansRegular',
    primarySwatch: Colors.blue,
    primaryColor: Colors.black,
    accentColor: Colors.blue,
    disabledColor: Colors.grey,
    cardColor: const Color(0xff1f2124),
    canvasColor: Colors.black,
    brightness: Brightness.dark,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: const ColorScheme.dark(),
        buttonColor: Colors.blue,
        splashColor: Colors.black),
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(color: Colors.black)),
  );
}

lightTheme(context) {
  return ThemeData(
    fontFamily: 'GoogleSansRegular',
    primarySwatch: Colors.blue,
    primaryColor: Colors.white,
    accentColor: Colors.blue,
    disabledColor: Colors.grey,
    cardColor: Colors.white,
    canvasColor: Colors.white,
    brightness: Brightness.light,
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: const ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white),
    appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        titleTextStyle: TextStyle(color: Colors.white)),
  );
}
