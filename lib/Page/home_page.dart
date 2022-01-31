import 'package:flutter/material.dart';
import 'package:pro_resume/Tabs/AboutSection.dart';
import 'package:pro_resume/main.dart';

import '../Resources/assetsConstant.dart';
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            label: 'Resume',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_screen_share),
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
      return const Center(child: Text('Resume'));
    } else {
      return const Center(child: Text('Projects'));
    }
  }
}
