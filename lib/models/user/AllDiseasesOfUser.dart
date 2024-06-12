class AllDiseasesOfUserModel {
  String? statusCode;
  bool? succeeded;
  String? message;
  // List<Null>? errors;
  List<DiseasesOfUser>? data;

  AllDiseasesOfUserModel(
      {this.statusCode, this.succeeded, this.message, this.data});

  AllDiseasesOfUserModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    // if (json['errors'] != null) {
    //   errors = <Null>[];
    //   json['errors'].forEach((v) {
    //     errors!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['data'] != null) {
      data = <DiseasesOfUser>[];
      json['data'].forEach((v) {
        data!.add( DiseasesOfUser.fromJson(v));
      });
    }
  }
}

class DiseasesOfUser {
  String? firstName;
  String? lastName;
  String? maritalStatus;
  String? gender;
  String? type;
  int? valueResult;
  String? description;
  int? height;
  int? weight;
  String? diseaseName;
  String? diseaseDescription;
  String? diseaseSymptoms;
  String? diseaseCauses;
  String? diagnosis;
  String? diagnosisDate;
  List<String>? docViewUrl;

  DiseasesOfUser(
      {this.firstName,
      this.lastName,
      this.maritalStatus,
      this.gender,
      this.type,
      this.valueResult,
      this.description,
      this.height,
      this.weight,
      this.diseaseName,
      this.diseaseDescription,
      this.diseaseSymptoms,
      this.diseaseCauses,
      this.diagnosis,
      this.diagnosisDate,
      this.docViewUrl});

  DiseasesOfUser.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    maritalStatus = json['maritalStatus'];
    gender = json['gender'];
    type = json['type'];
    valueResult = json['valueResult'];
    description = json['description'];
    height = json['height'];
    weight = json['weight'];
    diseaseName = json['diseaseName'];
    diseaseDescription = json['diseaseDescription'];
    diseaseSymptoms = json['diseaseSymptoms'];
    diseaseCauses = json['diseaseCauses'];
    diagnosis = json['diagnosis'];
    diagnosisDate = json['diagnosisDate'];
    docViewUrl = json['docViewUrl'].cast<String>();
  }

}
