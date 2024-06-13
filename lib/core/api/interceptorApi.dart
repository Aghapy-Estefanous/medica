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
    options.headers['Authorization']= 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ2hhcHkiLCJqdGkiOiJmYzE1OTVlNC0yYjIxLTQzNjctYTU3MS1kZDYyYjI5N2UzYTkiLCJlbWFpbCI6ImFnaGFweTA4MEBnbWFpbC5jb20iLCJ1aWQiOiIxMTIyMzM0NDU1NjY3NyIsInJvbGVzIjoiVXNlciIsImV4cCI6MTcyMDUzMzQ1NX0.F02wKFgGnYsTNSjyYrHzHwSm9e5R0kUpOIwPRnPWUP0';
   // options.headers['Authorization']= 'Bearer ${await CachHelper.getdata(key: 'token')}';
    super.onRequest(options, handler);
  }

}