import 'package:dio/dio.dart';
import 'package:medica/core/api/apiConsumer.dart';
import 'package:medica/core/errors/Exceptions.dart';
import 'package:medica/core/api/interceptorApi.dart';
import 'package:medica/core/errors/error_model.dart';
import 'package:medica/shared/network/remote/endpoint.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
   
  DioConsumer({required this.dio})
  {
           dio.options.baseUrl=Endpoint.BaseUrl;
           dio.interceptors.add(ApiInterceptor());
           //dio.interceptors.add(LogInterceptor(requestHeader: true,request: true,responseBody: true));
  }
  @override
  Future delete(String url,
      {Object? data, Map<String, dynamic>? queryParameter}) async {
    try {
      final response =
          await dio.delete(url, data: data, queryParameters: queryParameter);

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

 

  @override
  Future get(String url, {Object? data, Map<String, dynamic>? queryParameter})async {
   try {
      final response =
          await dio.get(url, data: data, queryParameters: queryParameter);

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String url,
      {Object? data, Map<String, dynamic>? queryParameter}) async{
    try {
      final response =
          await dio.post(url, data: data, queryParameters: queryParameter);

      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
