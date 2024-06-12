class DataModel {
  String title;
  String description;
  int testId;
  TestResultModel test;
  List<dynamic> files;

  DataModel({
    required this.title,
    required this.description,
    required this.testId,
    required this.test,
    required this.files,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      title: json['title'],
      description: json['description'],
      testId: json['testId'],
      test: TestResultModel.fromJson(json['test']),
      files: List<dynamic>.from(json['files']),
    );
  }
}

class TestResultModel {
  int id;
  String name;
  dynamic description;
  int photoID;
  dynamic photo;

  TestResultModel({
    required this.id,
    required this.name,
    this.description,
    required this.photoID,
    this.photo,
  });

  factory TestResultModel.fromJson(Map<String, dynamic> json) {
    return TestResultModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      photoID: json['photoID'],
      photo: json['photo'],
    );
  }
}
