import 'dart:html' as html;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pro_resume/Resources/StringConstants.dart';

import '../Model/projectModel.dart';

class ProjectWidget extends StatelessWidget {
  final Project _project;
  final double _bottomPadding;

  const ProjectWidget(this._project, this._bottomPadding);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FlipCard(
      fill: Fill.fillBack,
      // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL,
      front: Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, _bottomPadding),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 40,
                  child: Image.asset(
                    _project.image,
                    width: width * .25,
                    height: width * .25,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
                Expanded(
                  flex: 60,
                  child: Container(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Text(
                          _project.name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: height * .05,
                        ),
                        AutoSizeText(
                          _project.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          softWrap: true,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      back: Card(
        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, _bottomPadding),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text('Tech Stack Used :'),
              ),
              Expanded(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  children: List.generate(
                    _project.techStack.length,
                    (index) {
                      return Center(child: Text(_project.techStack[index]));
                    },
                  ),
                ),
              ),
              _project.link != "N.A"
                  ? GestureDetector(
                      child: const Text(
                        'For Project Link Click Here !!',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      onTap: onProjectClick,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void onProjectClick() {
    html.window.open(_project.link, myName);
  }
}
