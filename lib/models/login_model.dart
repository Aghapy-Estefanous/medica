class LoginModel {
  dynamic status;
  bool? succeeded;
  String? message;
  UserModel? data;
  String? error;

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

    

    data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }
}

class UserModel {
  String? name;
  String? email;
  String? nid;
  String? gender;
  bool? isAuthenticated;
  String? token;

  UserModel.fromJson(Map<String, dynamic> json) {
    nid = json['nid'];
    name = json['name'];
    email = json['email'];
    isAuthenticated = json['isAuthenticted'];
    gender = json['gender'];
    token = json['token'];
  }
}
