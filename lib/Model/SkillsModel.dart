class SkillsModel {
  String skillName;
  double percent;
  SkillType skillType;

  SkillsModel(this.skillType, this.skillName, this.percent);
}

enum SkillType { LANGUAGE, FRAMEWORK, VC }
