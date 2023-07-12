class SkillsModel {
  String skillName;
  double percent;
  SkillType skillType;

  SkillsModel(this.skillType, this.skillName, this.percent);
}

// ignore: constant_identifier_names
enum SkillType { LANGUAGE, FRAMEWORK, VC }
