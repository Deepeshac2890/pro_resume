import 'package:flutter/material.dart';
import 'package:pro_resume/Page/HomePage.dart';
import 'package:pro_resume/Tabs/AboutSection.dart';
import 'package:pro_resume/Tabs/MySkills.dart';
import 'package:pro_resume/main.dart';
import 'package:share_plus/share_plus.dart';

import '../Constants/assetsConstant.dart';
import '../Tabs/ProjectsSection.dart';
import '../Tabs/Resume.dart';

class HomePage extends StatefulWidget {
  final int preSelectedIndex;

  const HomePage({Key? key, required this.preSelectedIndex}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> tabWidgets = <Widget>[
    const AboutTab(),
    const ResumeViewer(),
    const MySkills(),
    const ProjectsTab(),
  ];

  @override
  void initState() {
    if (widget.preSelectedIndex != -1) {
      _selectedIndex = widget.preSelectedIndex;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              CompleteHomePage.of(context)
                  ?.changeNavigationStyle(0, _selectedIndex);
            },
            icon: Image.asset(Assets.switchIcon),
          ),
          IconButton(
              onPressed: () {
                Share.share(
                    'Check out this portfolio : https://deepeshacharya.netlify.app/');
              },
              icon: Image.asset(Assets.share)),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              MyApp.of(context)?.changeTheme();
            },
            icon: (MyApp.of(context)?.isCurrentDarkMode() ?? true)
                ? Image.asset(
                    Assets.sun,
                    height: 20,
                    width: 20,
                  )
                : Image.asset(
                    Assets.moonLight,
                    height: 20,
                    width: 20,
                  ),
          )
        ],
      ),
      body: Center(
        child: tabWidgets.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'About',
            icon: _selectedIndex == 0
                ? Text('')
                : Text(
                    'About',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? Text('')
                : Text(
                    'Resume',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            label: 'Resume',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? Text('')
                : Text(
                    'My Skills',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            label: 'My Skills',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? Text('')
                : Text(
                    'Projects',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            label: 'Projects',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Theme.of(context).accentColor,
      ),
    );
  }
}
