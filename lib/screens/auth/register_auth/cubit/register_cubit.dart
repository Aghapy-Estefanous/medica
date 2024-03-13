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
    required String nid,
    required String username,
    required String name,
    required String gender,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    emit(RegisterLoadingState());

    dio_helper.postData(url: BaseUrl + REGISTER, data: {
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
        print("all is ok 200");
      }
      emit(RegisterSuccessState(CURRENT_USER));
    }).catchError((e) {
      print(e.toString());
      emit(RegisterErrorState(e.toString()));
    });
  }

  //for register
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
    emit(RsgisterVisiablityIconState());
  }
}
