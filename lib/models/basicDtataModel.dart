import 'package:dio/dio.dart';

class BasicDataModel {
  String statusCode;
  dynamic meta;
  bool succeeded;
  String message;
  dynamic errors;
  DataModel data;

  BasicDataModel({
    required this.statusCode,
    required this.meta,
    required this.succeeded,
    required this.message,
    required this.errors,
    required this.data,
  });

  factory BasicDataModel.fromJson(Response<dynamic> response) {
    Map<String, dynamic> json = response.data;
    return BasicDataModel(
      statusCode: json["statusCode"],
      meta: json["meta"],
      succeeded: json["succeeded"],
      message: json["message"],
      errors: json["errors"],
      data: DataModel.fromJson(json["data"]),
    );
  }
  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "meta": meta,
        "succeeded": succeeded,
        "message": message,
        "errors": errors,
        "data": data.toJson(),
      };
}

class DataModel {
  String firstName;
  String lastName;
  String email;
  dynamic phoneNumber;
  String nid;
  dynamic bloodType;
  int age;
  dynamic report;

  DataModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.nid,
    required this.bloodType,
    required this.age,
    required this.report,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        nid: json["nid"],
        bloodType: json["bloodType"],
        age: json["age"],
        report: json["report"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "nid": nid,
        "bloodType": bloodType,
        "age": age,
        "report": report,
      };
}
