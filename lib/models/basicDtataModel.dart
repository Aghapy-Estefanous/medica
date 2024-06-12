class BasicDataModel {
  String? statusCode;
  bool? succeeded;
  String? message;

  BasicDataData? data;

  BasicDataModel({this.statusCode, this.succeeded, this.message, this.data});

  BasicDataModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];

    succeeded = json['succeeded'];
    message = json['message'];

    data = json['data'] != null ? BasicDataData.fromJson(json['data']) : null;
  }
}

class BasicDataData {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? nid;
  String? bloodType;
  int? age;
  // List<Null>? report;

  BasicDataData({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.nid,
    this.bloodType,
    this.age,
    // this.report
  });

  BasicDataData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    nid = json['nid'];
    bloodType = json['bloodType'];
    age = json['age'];
    // if (json['report'] != null) {
    //   report = <Null>[];
    //   json['report'].forEach((v) {
    //     report!.add(new Null.fromJson(v));
    //   });
    // }
  }
}
