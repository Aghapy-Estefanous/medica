import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/models/login_model.dart';
import 'package:medica/shared/network/remote/endpoint.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'package:medica/screens/auth/register_auth/cubit/register_State.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  void postRegiserData({
    required String firstName,
    required String lastName,
    required String nid,
    required String username,
    required String name,
    required String gender,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    emit(RegisterLoadingState());

    dio_helper.postData(url:  Endpoint.BaseUrl+Endpoint.REGISTER, data: {
      'firstName': firstName,
      'lastName': lastName,
      'nid': nid,
      'username': username,
      'gender': gender,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    }).then((value) {
      print("here the data send ${value!.data}");
      LoginModel CURRENT_USER = LoginModel.fromJson(value.data);
      if (value.statusCode != 200) {
        print("there is some error${value.statusCode}");
      } else {
        print(value.statusMessage);
      }
      emit(RegisterSuccessState(CURRENT_USER));
    }).catchError((e) {
      print(e.toString());
      emit(RegisterErrorState(e.toString()));
    });
  }

  //for register
  //VisiablityIconState
  bool isvisiable = true;
  bool isvisiable2 = true;
  IconData icon = Icons.visibility_off;
  IconData icon2 = Icons.visibility_off;
  void ChangeVisiablityIcon() {
    if (isvisiable) {
      icon = Icons.visibility;

      isvisiable = !isvisiable;
    } else {
      icon = Icons.visibility_off;
      isvisiable = !isvisiable;
    }
    emit(RsgisterVisiablityIconState());
  }

  void ChangeVisiablityIcon2() {
    if (isvisiable2) {
      icon2 = Icons.visibility;
      isvisiable2 = !isvisiable2;
    } else {
      icon2 = Icons.visibility_off;
      isvisiable2 = !isvisiable2;
    }
    emit(RsgisterVisiablityIconState());
  }
}
