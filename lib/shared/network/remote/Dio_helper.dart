import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dio_helper {
  static late Dio dio;
  static init() {
    // dio?.options.headers['Authorization'] = 'f96edd43fbc848b69a17ab04fec81381';
    dio = Dio(BaseOptions(
      baseUrl: 'http://medicalsystem-001-site1.ftempurl.com',
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
    //
    @required String? url,
    @required Map<String, dynamic>? query,
    String lang = 'en',
    String? AccessToken,
  }) async {
    dio.options.headers = {
      //  زود ع الهيدرز عشن محتاجهم لما لوجاوت او لما اغير اللغه او عشن اجيب الاتا سوء مفضلة او ف الشحن من غلال توكن اليوزر
      //'lang': lang,
      'Content-Type': 'application/json',
      'tokenAuthorization': 'Bearer ${AccessToken}'
    };
    return await dio.get(url!, queryParameters: query);
  }

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
      'tokenAuthorization': 'Bearer ${AccessToken}'
    };
    return await dio.post(url, queryParameters: query, data: data);
  }
}
