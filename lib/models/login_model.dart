class LoginModel {
  // int? status;
  // String? message;
  UserModel? data;
  LoginModel({
    // this.status,
    // this.message,
    this.data,
  });
  LoginModel.fromjason(Map<String, dynamic> json) {
    // status = json['status'];
    // message = json['message'];
    data = json['data'] != null ? UserModel.Fromjson(json['data']) : null;
  }
}

class UserModel {
  String? name;
  String? email;
  String? nid;
  String? gender;
  bool? isAuthenticted;
  String? token;

  //named constructor "with any name" and delete ordinary constructor
  UserModel.Fromjson(Map<String, dynamic> jsondata) {
    nid = jsondata['nid'];
    name = jsondata['username'];
    email = jsondata['email'];
    isAuthenticted = jsondata['isAuthenticted'];
    gender = jsondata['gender'];
    token = jsondata['token'];
  }
}
