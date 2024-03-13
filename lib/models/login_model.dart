class LoginModel {
  dynamic status;
  bool? succeeded;
  String? message;
  UserModel? data;
  List<Map<String, dynamic>>? errorsList;

  LoginModel({
    this.status,
    this.succeeded,
    this.message,
    this.data,
    this.errorsList,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['statusCode'];
    succeeded = json['succeeded'];
    message = json['message'];

    errorsList = [];
    if (json['errors'] != null) {
      json['errors'].forEach((element) {
        errorsList?.add(Map<String, dynamic>.from(element));
      });
    }

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
