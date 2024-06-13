class DataModel {
  String title;
  String description;
  int testId;
  TestResultModel test;
  List<FileModel> files;

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
      files: List<FileModel>.from(
          json['files'].map((file) => FileModel.fromJson(file))),
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

class FileModel {
  int id;
  String title;
  String fileName;
  String folderName;
  String filePath;
  String viewUrl;
  String downloadUrl;
  String type;
  DateTime creation;

  FileModel({
    required this.id,
    required this.title,
    required this.fileName,
    required this.folderName,
    required this.filePath,
    required this.viewUrl,
    required this.downloadUrl,
    required this.type,
    required this.creation,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json['id'],
      title: json['title'],
      fileName: json['fileName'],
      folderName: json['folderName'],
      filePath: json['filePath'],
      viewUrl: json['viewUrl'],
      downloadUrl: json['downloadUrl'],
      type: json['type'],
      creation: DateTime.parse(json['creation']),
    );
  }
}
