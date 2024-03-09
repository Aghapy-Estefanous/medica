import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';

import '../../../../models/login_model.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());
  static NewPasswordCubit get(context) => BlocProvider.of(context);

  void postRegiserData({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    emit(NewPasswordLoadingState());

    dio_helper.postData(
        url: 'http://medicalsystem-001-site1.ftempurl.com/api/Auth/register',
        data: {
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        }).then((value) {
      print("here the data send ${value!.data}");
      LoginModel CURRENT_USER = LoginModel.fromjason(value.data);
      if (value.statusCode != 200) {
        print("there is some error${value.statusCode}");
      } else {
        print("all is ok 200");
      }
      emit(NewPasswordSuccessState(CURRENT_USER));
    }).catchError((e) {
      print(e.toString());
      emit(NewPasswordErrorState(e.toString()));
    });
  }

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
    emit(NewPasswordVisiablityIconState());
  }

  void ChangeVisiablityIcon2() {
    if (isvisiable) {
      icon2 = Icons.visibility_off;
      isvisiable2 = !isvisiable2;
    } else {
      icon2 = Icons.visibility;
      isvisiable2 = !isvisiable2;
    }
    emit(NewPasswordVisiablityIconState());
  }
}
