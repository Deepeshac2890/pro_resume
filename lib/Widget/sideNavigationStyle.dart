import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pro_resume/Constants/widgetConstant.dart';
import 'package:pro_resume/Page/HomePage.dart';
import 'package:pro_resume/Tabs/AboutSection.dart';
import 'package:pro_resume/Tabs/MySkills.dart';
import 'package:pro_resume/Tabs/Resume.dart';
import 'package:pro_resume/main.dart';
import 'package:share_plus/share_plus.dart';

import '../Constants/StringConstants.dart';
import '../Constants/assetsConstant.dart';
import '../Tabs/ProjectsSection.dart';

class SideNavigationBar extends StatefulWidget {
  final int preSelectedTabIndex;

  const SideNavigationBar({Key? key, required this.preSelectedTabIndex})
      : super(key: key);

  @override
  _SideNavigationBarState createState() => _SideNavigationBarState();
}

class _SideNavigationBarState extends State<SideNavigationBar> {
  Widget selectedTab = const AboutTab();
  var _selectedIndex = 0;

  void switchTab(int tabNumber) {
    if (tabNumber == 0) {
      selectedTab = const AboutTab();
    } else if (tabNumber == 1) {
      selectedTab = const ResumeViewer();
    } else if (tabNumber == 2) {
      selectedTab = const MySkills();
    } else {
      selectedTab = const ProjectsTab();
    }

    setState(() {
      _selectedIndex = tabNumber;
      selectedTab = selectedTab;
    });
  }

  @override
  void initState() {
    if (widget.preSelectedTabIndex != -1) {
      _selectedIndex = widget.preSelectedTabIndex;
      switchTab(_selectedIndex);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: const Border(),
              color: (MyApp.of(context)?.isDarkMode ?? false)
                  ? Colors.white
                  : Colors.black,
            ),
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: screenWidth > 1350
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              (MyApp.of(context)?.isDarkMode ?? false)
                                  ? Assets.dLetter
                                  : Assets.dLetterWhite,
                              height: MediaQuery.of(context).size.height * 0.3,
                            ),
                            AutoSizeText(
                              "Deepesh",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                      color: (MyApp.of(context)?.isDarkMode ??
                                              false)
                                          ? Colors.black
                                          : Colors.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("Software Engineer",
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    color:
                                        (MyApp.of(context)?.isDarkMode ?? false)
                                            ? Colors.black
                                            : Colors.white)),
                          ],
                        )
                      : Container(),
                ),
                Container(
                  decoration: getNavItemSelectedDecor(
                      (MyApp.of(context)?.isDarkMode ?? false),
                      _selectedIndex == 0),
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: MaterialButton(
                    elevation: 5,
                    textColor: Colors.blueAccent,
                    splashColor: Colors.redAccent,
                    onPressed: () {
                      switchTab(0);
                    },
                    child: const Center(
                      child: Text('About'),
                    ),
                  ),
                ),
                Container(
                  decoration: getNavItemSelectedDecor(
                      (MyApp.of(context)?.isDarkMode ?? false),
                      _selectedIndex == 1),
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: MaterialButton(
                    elevation: 5,
                    textColor: Colors.blueAccent,
                    splashColor: Colors.redAccent,
                    onPressed: () {
                      switchTab(1);
                    },
                    child: const Center(
                      child: Text('Resume'),
                    ),
                  ),
                ),
                Container(
                  decoration: getNavItemSelectedDecor(
                      (MyApp.of(context)?.isDarkMode ?? false),
                      _selectedIndex == 2),
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: MaterialButton(
                    elevation: 5,
                    textColor: Colors.blueAccent,
                    splashColor: Colors.redAccent,
                    onPressed: () {
                      switchTab(2);
                    },
                    child: const Center(
                      child: Text('My Skills'),
                    ),
                  ),
                ),
                Container(
                  decoration: getNavItemSelectedDecor(
                      (MyApp.of(context)?.isDarkMode ?? false),
                      _selectedIndex == 3),
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: MaterialButton(
                    elevation: 5,
                    textColor: Colors.blueAccent,
                    splashColor: Colors.redAccent,
                    onPressed: () {
                      switchTab(3);
                    },
                    child: const Center(
                      child: Text('Projects'),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                          onPressed: () {
                            Share.share(
                                shareText);
                          },
                          icon: Image.asset(Assets.share)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          MyApp.of(context)?.changeTheme();
                        },
                        icon: (MyApp.of(context)?.isCurrentDarkMode() ?? true)
                            ? Image.asset(
                                Assets.sun,
                              )
                            : Image.asset(
                                Assets.moon,
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          CompleteHomePage.of(context)
                              ?.changeNavigationStyle(1, _selectedIndex);
                        },
                        icon: Image.asset(Assets.switchIcon),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: selectedTab),
        ],
      ),
    );
  }
}
