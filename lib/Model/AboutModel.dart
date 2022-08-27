class AboutModel {
  late String header;

  AboutModel(this.header);

  AboutModel.fromJson(Map<String, dynamic> json) {
    header = json['Header'];
  }
}
