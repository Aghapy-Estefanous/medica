import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:medica/shared/network/remote/endpoint.dart';

class dio_helper {
  static late Dio dio;
  static init() {
    // dio?.options.headers['Authorization'] = 'f96edd43fbc848b69a17ab04fec81381';
    dio = Dio(BaseOptions(
      baseUrl: Endpoint.BaseUrl,

      receiveDataWhenStatusError: true,
      validateStatus: (status) {
        return status! >= 200 && status < 500; // Adjust as needed
      },
      // headers: {         ❌ "remove and use it get & post data"
      //   //const header
      //   'Content-Type': 'application/json',
      // }
    ));
  }

  static Future<Response?> getData({
    @required String? url,
    Map<String, dynamic>? query,
    String lang = 'en',
    @required String? AccessToken,
  }) async {
    try {
      var headers = {
        // 'Authorization': 'Bearer $AccessToken',

        'Authorization': AccessToken,

        'Content-Type': 'application/json',
      };
      var dio = Dio();
      dio.options.headers.addAll(headers);
      Response response = await dio.get(url!, queryParameters: query);
      return response;
    } catch (error) {
      print('Error fetching data: $error');
      return null;
    }
  }

  // static Future<Response?> getData({
  //   //
  //   @required String? url,
  //  Map<String, dynamic>? query,
  //   String lang = 'en',
  //   @required  String? AccessToken,
  // }) async {

  //   dio.options.headers = {
  //     //  زود ع الهيدرز عشن محتاجهم لما لوجاوت او لما اغير اللغه او عشن اجيب الاتا سوء مفضلة او ف الشحن من غلال توكن اليوزر
  //     //'lang': lang,
  //     'Content-Type': 'application/json',
  //     'tokenAuthorization': 'Bearer $AccessToken'
  //   };
  //   return await dio.get(url!, queryParameters: query);
  // }
// curl --location '//api/Reservation/ReservationINFO/<integer>' \
// --header 'Authorization: Bearer {{bearerToken}}'
  static Future<Response?> postData({
    required String url, //endpionts
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? AccessToken,
    String? lang,
  }) async {
    dio.options.headers = {
      //زود ع الهيدرز عشن محتاجهم لما لوجاوت او لما اغير اللغه
      // 'lang': lang,
      'Content-Type': 'application/json',
      'accept': '*/*',
      //'tokenAuthorization': 'Bearer ${AccessToken}'
    };
    return await dio.post(url, queryParameters: query, data: data);
  }
}
