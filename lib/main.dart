import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro_resume/Page/home_page.dart';

import 'Constants/StringConstants.dart';
import 'Themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

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
        if (snapshot.hasError) {
          SnackBar snackBar =
              const SnackBar(content: Text('Sorry some error has occurred'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: myName,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
            theme: isDarkMode ? darkTheme(context) : lightTheme(context),
          );
        }
        return const CircularProgressIndicator();
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
