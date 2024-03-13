// class LoginModel {
//   dynamic status;
//   bool? succeeded;
//   String? message;
//   UserModel? data;
//   List<String>? ErrorsList = [];
//   LoginModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//   LoginModel.fromjason(Map<String, dynamic> json) {
//     status = json['statusCode'];
//     message = json['message'];
//     message = json['succeeded'];

//     json['errors'].forEach((element) {
//       ErrorsList?.add(element);
//     });
//     data = json['data'] != null ? UserModel.Fromjson(json['data']) : null;
//   }
// }

// class UserModel {
//   String? name;
//   String? email;
//   String? nid;
//   String? gender;
//   bool? isAuthenticted;
//   String? token;

//   //named constructor "with any name" and delete ordinary constructor
//   UserModel.Fromjson(Map<String, dynamic> jsondata) {
//     nid = jsondata['nid'];
//     name = jsondata['name'];
//     email = jsondata['email'];
//     isAuthenticted = jsondata['isAuthenticted'];
//     gender = jsondata['gender'];
//     token = jsondata['token'];
//   }
// }
