class UserReservationModel {
  String? statusCode;
  bool? succeeded;
  String? message;
  List<DataUserReservation>? data;

  UserReservationModel({
    this.statusCode,
    this.succeeded,
    this.message,
    this.data,
  });

  UserReservationModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataUserReservation>[];
      json['data'].forEach((v) {
        data!.add(DataUserReservation.fromJson(v));
      });
    }
  }
}

class DataUserReservation {
  String? firstname;
  String? lastname;
  String? nid;
  String? placeName;
  String? time;
  var price;
  var waiting;

  DataUserReservation({
    this.firstname,
    this.lastname,
    this.nid,
    this.placeName,
    this.time,
    this.price,
    this.waiting,
  });

  DataUserReservation.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    nid = json['nid'];
    placeName = json['placeName'];
    time = json['time'];
    price = json['price'];
    waiting = json['waiting'];
  }
}
