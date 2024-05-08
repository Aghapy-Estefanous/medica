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
  String? department;
  String? placePrices;
  // String? reservations;

  DataClinic({
    this.id,
    this.name,
    this.departmentID,
    this.department,
    this.placePrices,
    //this.reservations
  });

  DataClinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    departmentID = json['departmentID'];
    department = json['department'];
    placePrices = json['placePrices'];
    //  reservations = json['reservations'];
  }
}
