import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pro_resume/Model/projectModel.dart';

import '../Constants/assetsConstant.dart';
import '../Constants/projectsConstants.dart';
import '../Widget/ProjectWidget.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({Key? key}) : super(key: key);

  @override
  _ProjectsTabState createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {
  TextEditingController textController = TextEditingController();
  String techStackSearched = "";
  String status = "All";
  List<Project> filteredProject = projects.cast<Project>();
  var breakPoint = 1170;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > breakPoint) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onHorizontalDragDown: (dragDownDetails) {
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                      },
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          techStackSearched = value;
                          filterProjects();
                        },
                        decoration: const InputDecoration(
                          hintText:
                              'Search Project with Tech Stack (For mutiple stacks use , as seperator)',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 5.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.blueAccent, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Expanded(
                    flex: 1,
                    child: DropdownButton<String>(
                      icon: Image.asset(
                        Assets.dropDownArrow,
                        height: 15,
                        width: 15,
                      ),
                      isExpanded: true,
                      value: status,
                      items: <String>['Completed', 'Under Progress', 'All']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          status = value ?? 'All';
                          filterProjects();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 32.0),
                crossAxisCount: 3,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.3),
                children: List.generate(filteredProject.length,
                    (index) => ProjectWidget(filteredProject[index], 0, false)),
              ),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
          itemCount: filteredProject.length,
          itemBuilder: (context, index) => ProjectWidget(filteredProject[index],
              (index == filteredProject.length - 1 ? 16.0 : 0), true));
    }
  }

  void filterProjects() {
    filteredProject = projects.cast<Project>();

    if (techStackSearched != "") {
      if (techStackSearched.contains(',')) {
        final split = techStackSearched.split(',');
        for (var i = 0; i < split.length; i++) {
          filteredProject = filteredProject
              .where((element) => element.techStack.contains(split[i].trim()))
              .toList();
        }
      } else {
        filteredProject = filteredProject
            .where((e) => e.techStack.contains(techStackSearched.trim()))
            .toList();
      }
    }

    if (status == "Completed") {
      filteredProject = filteredProject.where((e) => e.isCompleted).toList();
    } else if (status == "Under Progress") {
      filteredProject = filteredProject.where((e) => !(e.isCompleted)).toList();
    }

    setState(() {
      filteredProject = filteredProject;
    });
  }
}
