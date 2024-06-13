import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(
    String url, {
    Object? data,
    
    Map<String, dynamic>? queryParameter,
    
  });
  Future<dynamic> getAsFormData(
    String url, {
    FormData? data,
    Map<String, dynamic>? queryParameter,
    
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
