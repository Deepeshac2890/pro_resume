import 'package:flutter/material.dart';
import 'package:pro_resume/Tabs/AboutSection.dart';
import 'package:pro_resume/main.dart';

import '../Constants/assetsConstant.dart';
import '../Tabs/ProjectsSection.dart';
import '../Tabs/Resume.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> tabWidgets = <Widget>[
    const AboutTab(),
    const ResumeViewer(),
    const ProjectsTab()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: getTitle(),
        actions: [
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
                    Assets.moon,
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'About',
            icon: Image.asset(
              Assets.profile,
              height: 20,
              width: 20,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.resume,
              height: 20,
              width: 20,
            ),
            label: 'Resume',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              Assets.project,
              height: 20,
              width: 20,
            ),
            label: 'Projects',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Theme.of(context).accentColor,
      ),
    );
  }

  Widget getTitle() {
    if (_selectedIndex == 0) {
      return const Text('');
    } else if (_selectedIndex == 1) {
      return const Center(
        child: Text(
          'Resume',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      );
    } else {
      return const Center(
        child: Text(
          'Projects',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      );
    }
  }
}
