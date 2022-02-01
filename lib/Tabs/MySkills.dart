import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../Constants/StringConstants.dart';

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

  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
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
                const Text(
                  skillOverview,
                  textScaleFactor: 1.4,
                  style: TextStyle(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCircularPercentIndicator(
                      "Flutter", 0.8, Colors.tealAccent),
                  buildCircularPercentIndicator(
                      "Native Android", 0.5, Colors.tealAccent),
                  buildCircularPercentIndicator(
                      "Docker", 0.7, Colors.tealAccent),
                  buildCircularPercentIndicator("Dart", 0.8, Colors.blueAccent),
                  buildCircularPercentIndicator("Java", 0.8, Colors.blueAccent),
                  buildCircularPercentIndicator(
                      "Git", 0.7, Colors.deepPurpleAccent),
                  buildCircularPercentIndicator(
                      "ADE", 0.8, Colors.deepPurpleAccent),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCircularPercentIndicator(
      String stackName, double percentage, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stackName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        LinearPercentIndicator(
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width * 0.3,
            lineHeight: 3.0,
            percent: percentage,
            progressColor: color),
        SizedBox(
          height: 15,
        )
      ],
    );
    // return CircularPercentIndicator(
    //   radius: 50.0,
    //   lineWidth: 10.0,
    //   percent: percentage,
    //   header: Text(stackName),
    //   // center: Text(stackName),
    //   backgroundColor: Colors.grey,
    //   progressColor: Colors.blue,
    // );
  }
}
