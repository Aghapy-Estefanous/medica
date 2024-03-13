import 'loginState.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/models/login_model.dart';
import 'package:medica/shared/network/remote/endpoint.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  late LoginModel CURRENT_USER;
  void userlogin({required String userName, required String password}) {
    emit(LoginLoadingState());

    dio_helper.postData(
            
        url: BaseUrl+LOGIN,
        data: {
          'userName': userName,
          'password': password,
        }).then((value) {
      print(value!.data);

      int? StatusCodeInt = value.statusCode;

      CURRENT_USER = LoginModel.fromJson(value.data);

      print("  message from me${value.data}");

      emit(LoginSuccessgState(CURRENT_USER, StatusCodeInt));
    }).catchError((error) {
      print(" error here : $error");
      emit(
        LoginErrorState(error),
      );
      // if (error is DioException) {
      //   // Access the response data from the DioError
      //   //LoginModel responseData =null;//= error.response?.data;
      //   emit(LoginErrorState(null, null));
      // } else {
      //   emit(
      //     LoginErrorState(
      //       null,
      //       error.toString(),
      //     ),
      //   );
      // }
    });
  }

  //VisiablityIconState
  bool isvisiable = false;
  IconData icon = Icons.visibility;
  void ChangeVisiablityIcon() {
    if (isvisiable) {
      icon = Icons.visibility_off;
      isvisiable = !isvisiable; //false
    } else {
      icon = Icons.visibility;
      isvisiable = !isvisiable;
    }
    emit(VisiablityIconState());
  }
  // register
}
