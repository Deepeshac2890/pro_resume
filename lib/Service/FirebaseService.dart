import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pro_resume/Model/AboutModel.dart';
import 'package:pro_resume/Model/SkillPageData.dart';
import 'package:pro_resume/Model/SkillsModel.dart';
import 'package:pro_resume/Model/projectModel.dart';

class FirebaseService {
  var fireStore = FirebaseFirestore.instance.collection("Details");

  Future<AboutModel> getAboutDetails() async {
    var docReference = await fireStore.doc("About Section").get();
    return AboutModel.fromJson(docReference.data() as Map<String, dynamic>);
  }

  Future<List<Project>> getProjects() async {
    var docData = await fireStore.doc("Projects").collection("Projects").get();
    var docs = docData.docs;
    List<Project> projects = [];
    docs.forEach((element) {
      var data = element.data();
      List group = data["Stack"] as List<dynamic>;
      Project project = Project(
          image: data["Icon"],
          name: data["Name"],
          description: data["Description"],
          link: data["Link"],
          techStack: group,
          isCompleted: data["Completed"] as bool);
      projects.add(project);
    });
    return projects;
  }

  Future<SkillPageData> getSkillsTabData() async {
    var documents = await fireStore.doc("Skills").collection("Framework").get();
    var docs = documents.docs;
    List<SkillsModel> skillsList = [];
    for (var element in docs) {
      SkillType sk;
      if (element.id == "Framework") {
        sk = SkillType.FRAMEWORK;
      } else if (element.id == "Language") {
        sk = SkillType.LANGUAGE;
      } else if (element.id == "VC") {
        sk = SkillType.VC;
      } else {
        sk = SkillType.LANGUAGE;
      }
      element.data().forEach((key, value) {
        SkillsModel sm =
            SkillsModel(sk, key, double.tryParse(value.toString()) ?? 0.8);
        skillsList.add(sm);
      });
    }
    var doc = await fireStore.doc("Skills").get();
    String summary = await doc.data()!["Summary"];
    summary = summary.replaceAll('\\n', '\n');
    SkillPageData spd = SkillPageData(skillsList, summary);
    return spd;
  }
}
