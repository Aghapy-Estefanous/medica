class UserReservationModel {
  String? statusCode;
  bool? succeeded;
  String? message;
  //List<dynamic>? errors;
  List<DataUserReservation>? data;
/*

*/

  UserReservationModel(
      {this.statusCode, this.succeeded, this.message, this.data});

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
  
  String? firstname;
  String? lastname;
  String? nid;
  String? placeName;
  String? time;
  double ? price;
  int?waiting;

  DataUserReservation(
      {this.firstname,
      this.lastname,
      this.nid,
      this.time,
      this.placeName,
      this.price,
      this.waiting});

  DataUserReservation.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
     lastname= json['lastname'];
    nid = json['nid'];
    time = json['time'];
    placeName = json['placeName'];
    price = json['price'];
    waiting = json['waiting'];
  }


}

// //.........................................................................................
// /**
// Response body
// Download
// {
//   "statusCode": "OK",
//   "meta": null,
//   "succeeded": true,
//   "message": "succeeded process",
//   "errors": null,
//   "data": {
//     "firstname": "Doaa",
//     "lastname": "Gamal",
//     "nid": "1234567891011",
//     "placeName": "Alpha",
//     "price": 341.4,
//     "time": "2024-03-16T22:23:23.9849549"
//   }
// }




//  */
// class ReservationInfoModel {
//   String? statusCode;
//   bool? succeeded;
//   String? message;
//   dynamic errors;
//   ReservationInfoModelData? data;

//   ReservationInfoModel(
//       {this.statusCode, this.succeeded, this.message, this.errors, this.data});

//   ReservationInfoModel.fromJson(Map<String, dynamic> json) {
//     statusCode = json['statusCode'];
//     succeeded = json['succeeded'];
//     message = json['message'];
//     errors = json['errors'];
//     data =
//         (json['data'] != null ? ReservationInfoModelData.fromJson(json['data']) : null);
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = Map<String, dynamic>();
//   //   data['statusCode'] = this.statusCode;
//   //   data['succeeded'] = this.succeeded;
//   //   data['message'] = this.message;
//   //   data['errors'] = this.errors;
//   //   if (this.data != null) {
//   //     data['data'] = this.data!.toJson();
//   //   }
//   //   return data;
//   // }

// }

// class ReservationInfoModelData {
//   int? id;
//   String? fname;
//   String? lname;
//   String? nid;
//   double? price;
//   String? placeName;
//   String? time;



//   ReservationInfoModelData.fromJson(Map<String, dynamic> json) {
//     nid = json['nid'];
//     fname = json['firstname'];
//     lname = json['lastname'];
//     price = json['price'];
//     placeName = json['placeName'];
//     time = json['time'];

//   }

// }
