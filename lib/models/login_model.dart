import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginModel {
  dynamic status;
  bool? succeeded;
  String? message;
  UserModel? data;
  String? error;
  // String? token;

  LoginModel({
    this.status,
    this.succeeded,
    this.message,
    this.data,
    this.error,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];
    succeeded = json['succeeded'];
    error = json['errors'];
    // token=SharedPreferences.getInstance().then((value) => value.getString('token'));
    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }
}

class UserModel {
  String? name;
  String? email;
  String? pass;
  String? nid;
  String? gender;
  bool? isAuthenticated;
  // String? token;

  UserModel.fromJson(Map<String, dynamic> json) {
    nid = json['nid'];
    name = json['name'];
    email = json['email'];
    pass = json['pass'];
    isAuthenticated = json['isAuthenticted'];
    gender = json['gender'];
    // token = json['token'];
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'pass': pass,
      'nid': nid,
      'gender': gender,
      'isAuthenticated': isAuthenticated,
      // 'token': token
    };
  }
}

// class SaveModel {
//   String? name;
//   String? password;
//   SaveModel({this.name, this.password});
//   SaveModel.fromJson(Map<String, dynamic> map) {
//     name = map['name'];
//     password = map['password'];
//   }
//   tojson() {
//     return {'name': name, 'password': password};
//   }
// }
// class SaveModel {
//   String? token;
//   // String? password;

//   SaveModel({this.token, });

//   SaveModel.fromJson(Map<String, dynamic> map) {
//     token = map['token'];
//     // name = map['name'];
//     // password = map['password'];
//   }

//   Map<String, dynamic> toJson() {
//     return {'token': token,};
//   }
// }

// void _save({required String token}) async {
//   SaveModel saveModel = SaveModel(token:token);
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.setString('saveModel', jsonEncode(saveModel.toJson()));
//   print(sharedPreferences.getString('saveModel'));
// }
