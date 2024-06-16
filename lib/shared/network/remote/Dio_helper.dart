import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/shared/network/remote/endpoint.dart';

class dio_helper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Endpoint.BaseUrl,
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! >= 200 && status < 500; // Adjust as needed
        },
      ),
    );
  }

  static Future<Response?> getData({
    @required String? url,
    Map<String, dynamic>? query,
    String lang = 'en',
    @required String? AccessToken,
  }) async {
    try {
      var headers = {
        'Authorization': 'Bearer $AccessToken',
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
      'Authorization': 'Bearer $AccessToken'
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response?> postDataWithFile({
    required String url, //endpionts
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    XFile? file,
    String? AccessToken,
    String? lang,
  }) async {
    dio.options.headers = {
      //زود ع الهيدرز عشن محتاجهم لما لوجاوت او لما اغير اللغه
      // 'lang': lang,
      // 'Content-Type': 'application/json',
      'accept': '*/*',
      'Authorization': 'Bearer $AccessToken'
    };
    FormData formData = FormData.fromMap(data);
    if (file != null) {
      formData.files.add(MapEntry(
        'Photo', // This should match the expected key on the backend
        await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last),
      ));
    }
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response?> putData({
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
    return await dio.put(url, queryParameters: query, data: data);
  }
}
