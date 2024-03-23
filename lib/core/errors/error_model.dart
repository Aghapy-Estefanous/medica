class ErrorModel {
  String? statusCode;
  String? message;
  String? succeeded;
  ErrorModel({this.statusCode, this.message, this.succeeded});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
        statusCode: json['statusCode'],
        message: json['message'],
        succeeded: json['succeeded']);
  }
}
