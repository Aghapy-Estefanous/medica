import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medica/shared/network/local/sharedPref.dart';

class ApiInterceptor  extends Interceptor
{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('Token');
   // options.headers['Authorization']= 'Bearer ${token}';
    options.headers['Authorization']= 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmb3gzMDQ0IiwianRpIjoiMWFiY2ZlODUtOTM2NC00N2VhLTk0ZjItZGIxNjg2MGNkZDc5IiwiZW1haWwiOiJzZWNlQG1haWxpbmF0b3IuY29tIiwidWlkIjoiMTQ3ODUyMzY5Nzg5NDUiLCJyb2xlcyI6IlVzZXIiLCJleHAiOjE3MjA1MTQ4NTd9.hC1iIDfNvJ0zXywxAcwN5bqOD7VTnKSeaPj-vHHM38c';
   // options.headers['Authorization']= 'Bearer ${await CachHelper.getdata(key: 'token')}';
    super.onRequest(options, handler);
  }

}