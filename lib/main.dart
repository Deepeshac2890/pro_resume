import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_resume/Page/HomePage.dart';

import 'Constants/StringConstants.dart';
import 'FirebaseOptionsProvider.dart';
import 'Themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: apiKey,
      appId: appID,
      messagingSenderId: msID,
      projectId: projectID,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  //Default is Light Theme
  bool isDarkMode = false;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: myName,
            home: const CompleteHomePage(),
            debugShowCheckedModeBanner: false,
            theme: isDarkMode ? darkTheme(context) : lightTheme(context),
          );
        }
        return Container();
      },
    );
  }

  void changeTheme() {
    setState(() {
      isDarkMode = !(isDarkMode);
    });
  }

  bool isCurrentDarkMode() {
    return isDarkMode;
  }
}
