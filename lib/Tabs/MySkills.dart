import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pro_resume/Constants/CachedData.dart';
import 'package:pro_resume/Constants/assetsConstant.dart';
import 'package:pro_resume/Model/SkillPageData.dart';
import 'package:pro_resume/Model/SkillsModel.dart';

import '../Service/FirebaseService.dart';

class MySkills extends StatefulWidget {
  const MySkills({Key? key}) : super(key: key);

  @override
  _MySkillsState createState() => _MySkillsState();
}

class _MySkillsState extends State<MySkills> {
  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  List<SkillsModel> skills = [];
  List<Widget> skillsWidget = [];
  late SkillPageData data;
  bool isLoading = true;
  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
  );

  @override
  void initState() {
    getSkillsData();
    super.initState();
  }

  void getSkillsData() async {
    if (skillsData == null) {
      data = await FirebaseService().getSkillsTabData();
    } else {
      data = skillsData!;
    }
    skills = data.skills;
    skillsWidget = buildSkills();
    isLoading = false;
    setState(() {});
  }

  List<Widget> buildSkills() {
    List<Widget> skillList = [];
    if (skills.isNotEmpty) {
      for (var skill in skills) {
        MaterialAccentColor color;
        if (skill.skillType == SkillType.LANGUAGE) {
          color = Colors.tealAccent;
        } else if (skill.skillType == SkillType.FRAMEWORK) {
          color = Colors.blueAccent;
        } else {
          color = Colors.deepPurpleAccent;
        }
        skillList.add(
            buildLinearPercentIndicator(skill.skillName, skill.percent, color));
      }
    }
    return skillList;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: Image.asset(Assets.loadingGif))
        : Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      AnimatedTextKit(animatedTexts: [
                        ColorizeAnimatedText(
                          'Skills \n& Experiences',
                          textStyle: colorizeTextStyle,
                          colors: colorizeColors,
                        ),
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.summary,
                        textScaleFactor: 1.4,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                    child: ListView(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: skillsWidget,
                      ),
                    ]),
                  ),
                )
              ],
            ),
          );
  }

  Widget buildLinearPercentIndicator(
      String stackName, double percentage, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stackName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        LinearPercentIndicator(
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width * 0.3,
            lineHeight: 3.0,
            percent: percentage,
            progressColor: color),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
