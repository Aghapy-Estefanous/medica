class UserReservationModel {
  String? statusCode;
  bool? succeeded;
  String? message;
  List<dynamic>? errors;
  List<Data>? data;

  UserReservationModel(
      {this.statusCode, this.succeeded, this.message, this.errors, this.data});

  UserReservationModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    // if (json['errors'] != null) {
    //   errors = <dynamic>[];
    //   json['errors'].forEach((v) {
    //     errors!.add(errors);
    //   });
    // }
    
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? dateTime;
  int? serialNumber;
  String? reservationState;
  int? placePriceId;
  String? userID;

  Data(
      {this.id,
      this.dateTime,
      this.serialNumber,
      this.reservationState,
      this.placePriceId,
      this.userID});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['DateTime'];
    serialNumber = json['serialNumber'];
    reservationState = json['reservationState'];
    placePriceId = json['placePriceId'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['DateTime'] = this.dateTime;
    data['serialNumber'] = this.serialNumber;
    data['reservationState'] = this.reservationState;
    data['placePriceId'] = this.placePriceId;
    data['userID'] = this.userID;
    return data;
  }
}
