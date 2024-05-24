import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loginState.dart';
import 'package:medica/models/login_model.dart';
import 'package:medica/shared/network/remote/endpoint.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel CURRENT_USER;

  void userlogin({required String userName, required String password}) {
    if (isClosed) return;
    emit(LoginLoadingState());

    dio_helper.postData(url: Endpoint.BaseUrl + Endpoint.LOGIN, data: {
      'userName': userName,
      'password': password,
    }).then((value) {
      if (isClosed) return;
      print(value!.data);

      int? StatusCodeInt = value.statusCode;

      CURRENT_USER = LoginModel.fromJson(value.data);
      if (value.statusCode == 200) {
        _save(name: userName, password: password);
        emit(LoginSuccessgState(CURRENT_USER, StatusCodeInt));
      } else {
        emit(LoginErrorState(value.data['message']));
      }
    }).catchError((error) {
      if (isClosed) return;
      if (error is DioException) {
        print("HTTP Error Status Code: ${error.response?.statusCode}");
        emit(LoginErrorState(error.response?.statusCode.toString() ?? "Unknown Error"));
      } else {
        print("Non-HTTP Error: $error");
        emit(LoginErrorState(error.toString()));
      }
    });
  }

  void _save({required String name, required String password}) async {
    SaveModel saveModel = SaveModel(name: name, password: password);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('saveModel', jsonEncode(saveModel.toJson()));
    print(sharedPreferences.getString('saveModel'));
  }

  //VisiablityIconState
  bool isvisiable = false;
  IconData icon = Icons.visibility;

  void ChangeVisiablityIcon() {
    isvisiable = !isvisiable;
    icon = isvisiable ? Icons.visibility_off : Icons.visibility;
    emit(VisiablityIconState());
  }

  @override
  Future<void> close() {
    // Any cleanup can be done here if needed before the cubit is closed.
    return super.close();
  }
}

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());

//   static LoginCubit get(context) => BlocProvider.of(context);
//   late LoginModel CURRENT_USER;

//   void userlogin({required String userName, required String password}) {
//     emit(LoginLoadingState());

//     dio_helper.postData(url: Endpoint.BaseUrl + Endpoint.LOGIN, data: {
//       'userName': userName,
//       'password': password,
//     }).then((value) {
//       print(value!.data);

//       int? StatusCodeInt = value.statusCode;

//       CURRENT_USER = LoginModel.fromJson(value.data);
//       if (value.statusCode == 200) _save(name: userName, password: password);
//       print("message from me${value.data}");

//       emit(LoginSuccessgState(CURRENT_USER, StatusCodeInt));
//     }).catchError((error) {
//       if (error is DioException) {
//         print("HTTP Error Status Code: ${error.response?.statusCode}");
//         emit(LoginErrorState(error.response!.statusCode.toString()));
//       } else {
//         print("Non-HTTP Error: $error");
//         // Handle non-HTTP errors here
//       }
//     });
//   }

//   void _save({required String name, required String password}) async {
//     SaveModel saveModel = SaveModel(name: name, password: password); // Properly initialize SaveModel
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.setString('saveModel', jsonEncode(saveModel.tojson()));
//     print(sharedPreferences.getString('saveModel'));
//   }

//   // VisibilityIconState
//   bool isvisiable = false;
//   IconData icon = Icons.visibility;

//   void ChangeVisiablityIcon() {
//     if (isvisiable) {
//       icon = Icons.visibility_off;
//       isvisiable = !isvisiable; // false
//     } else {
//       icon = Icons.visibility;
//       isvisiable = !isvisiable;
//     }
//     emit(VisiablityIconState());
//   }
//   // register
// }

// class SaveModel {
//   String? name;
//   String? password;

//   SaveModel({this.name, this.password});

//   SaveModel.fromJson(Map<String, dynamic> map) {
//     name = map['name'];
//     password = map['password'];
//   }

//   Map<String, dynamic> tojson() {
//     return {'name': name, 'password': password};
//   }
// }
