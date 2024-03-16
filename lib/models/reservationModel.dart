class UserReservationModel {
  String? statusCode;
  bool? succeeded;
  String? message;
  List<dynamic>? errors;
  List<DataUserReservation>? data;

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
      data = <DataUserReservation>[];
      json['data'].forEach((v) {
        data!.add( DataUserReservation.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['statusCode'] = this.statusCode;
  //   data['succeeded'] = this.succeeded;
  //   data['message'] = this.message;
  //   if (this.errors != null) {
  //     data['errors'] = this.errors!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class DataUserReservation {
  int? id;
  String? dateTime;
  int? serialNumber;
  String? reservationState;
  int? placePriceId;
  String? userID;

  DataUserReservation(
      {this.id,
      this.dateTime,
      this.serialNumber,
      this.reservationState,
      this.placePriceId,
      this.userID});

  DataUserReservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['DateTime'];
    serialNumber = json['serialNumber'];
    reservationState = json['reservationState'];
    placePriceId = json['placePriceId'];
    userID = json['userID'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['DateTime'] = this.dateTime;
  //   data['serialNumber'] = this.serialNumber;
  //   data['reservationState'] = this.reservationState;
  //   data['placePriceId'] = this.placePriceId;
  //   data['userID'] = this.userID;
  //   return data;
  // }
}

//............................................

class PlacePriceModel {
  String? statusCode;
  bool? succeeded;
  String? message;
  dynamic errors;
  DataPlacePrice? data;

  PlacePriceModel(
      {this.statusCode, this.succeeded, this.message, this.errors, this.data});

  PlacePriceModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    errors = json['errors'];
    data =
        (json['data'] != null ? DataPlacePrice.fromJson(json['data']) : null);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['statusCode'] = this.statusCode;
  //   data['succeeded'] = this.succeeded;
  //   data['message'] = this.message;
  //   data['errors'] = this.errors;
  //   if (this.data != null) {
  //     data['data'] = this.data!.toJson();
  //   }
  //   return data;
  // }

}

class DataPlacePrice {
  int? id;
  String? name;
  double? price;
  int? placeID;
  String? placeType;

  DataPlacePrice(
      {this.id, this.name, this.price, this.placeID, this.placeType});

  DataPlacePrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    placeID = json['placeID'];
    placeType = json['placeType'];
  }

}
