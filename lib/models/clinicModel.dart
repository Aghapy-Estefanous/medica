class ClinicModel {
  String? statusCode;
  bool? succeeded;
  String? message;
  var errors;
  List<DataClinic>? data;

  ClinicModel(
      {this.statusCode, this.succeeded, this.message, this.errors, this.data});

  ClinicModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = <DataClinic>[];
      json['data'].forEach((v) {
        data!.add(DataClinic.fromJson(v));
      });
    }
  }
}

class DataClinic {
   int? id;
  String? name;
  int? departmentID;
  String? description;
  int? reservationCount;
  String? departmentName;
  double? price;
  int? photoID;
  String? photo;
  List<String>? workdays;
  List<Shifts>? shifts;

 
  DataClinic(
      {this.id,
      this.name,
      this.departmentID,
      this.description,
      this.reservationCount,
      this.departmentName,
      this.price,
      this.photoID,
      this.photo,
      this.workdays,
      this.shifts});

   DataClinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    departmentID = json['departmentID'];
    description = json['description'];
    reservationCount = json['reservationCount'];
    departmentName = json['departmentName'];
    price = json['price'];
    photoID = json['photoID'];
    photo = json['photo'];
    workdays = json['workdays'].cast<String>();
    if (json['shifts'] != null) {
      shifts = <Shifts>[];
      json['shifts'].forEach((v) {
        shifts!.add(new Shifts.fromJson(v));
      });
    }
  }
}
class Shifts {
  int? id;
  String? name;
  String? startTime;
  String? endTime;

  Shifts({this.id, this.name, this.startTime, this.endTime});

  Shifts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}
