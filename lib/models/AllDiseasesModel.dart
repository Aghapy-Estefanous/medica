class Alldiseases {
  String? statusCode;
  bool? succeeded;
  String? message;
  List<singleDiseasObjectData>? data;

  Alldiseases({this.statusCode, this.succeeded, this.message, this.data});

  Alldiseases.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];

    succeeded = json['succeeded'];
    message = json['message'];

    if (json['data'] != null) {
      data = <singleDiseasObjectData>[];
      json['data'].forEach((v) {
        data!.add(new singleDiseasObjectData.fromJson(v));
      });
    }
  }
}

class singleDiseasObjectData {
  int? id;
  String? name;
  String? description;
  String? symptoms;
  String? causes;

  singleDiseasObjectData(
      {this.id, this.name, this.description, this.symptoms, this.causes});

  singleDiseasObjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    symptoms = json['symptoms'];
    causes = json['causes'];
  }
}
