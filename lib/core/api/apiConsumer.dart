import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(
    String url, {
    Object? data,
  });
  Future<dynamic> getWithqueryParameter(
    String url, {
    Object? data,
  });
  Future<dynamic> postAsFormData({
    required String apiUrl,
    FormData? data,
  });
  Future<dynamic> post(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameter,
  });
  Future<dynamic> delete(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameter,
  });
}
