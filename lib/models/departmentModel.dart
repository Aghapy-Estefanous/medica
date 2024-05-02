class DepartmentsModel {
  String? statusCode;
  bool? succeeded;
  String? message;
  String? errors;
  List<Data>? data;

  DepartmentsModel(
      {this.statusCode, this.succeeded, this.message, this.errors, this.data});

  DepartmentsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

}

class Data {
  int? id;
  String? name;
  int? hospitalID;


  Data({this.id, this.name, this.hospitalID,});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hospitalID = json['hospitalID'];

  }


}
