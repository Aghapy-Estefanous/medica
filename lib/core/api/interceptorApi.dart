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
    options.headers['Authorization']= 'Bearer ${token}';
   // options.headers['Authorization']= 'Bearer ${await CachHelper.getdata(key: 'token')}';
    super.onRequest(options, handler);
  }

}