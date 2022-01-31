class Project {
  String image;
  String name;
  String description;
  String link;
  List<String> techStack;
  bool isCompleted;
  Project(
      {required this.image,
      required this.name,
      required this.description,
      required this.link,
      required this.techStack,
      required this.isCompleted});
}
