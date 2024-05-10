import 'package:dio/dio.dart';
import 'package:medica/shared/network/local/sharedPref.dart';

class ApiInterceptor  extends Interceptor
{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    //options.headers['Authorization']= 'Bearer ${await CachHelper.getdata(key: 'token')}';
   // options.headers['Authorization']= 'Bearer ${await CachHelper.getdata(key: 'token')}';
    super.onRequest(options, handler);
  }

}