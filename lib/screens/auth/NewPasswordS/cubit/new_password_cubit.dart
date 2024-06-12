import '../../../../main.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../../../models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());
  static NewPasswordCubit get(context) => BlocProvider.of(context);

  void NewPass({
    required String email,
    required String newPassword,
    required String confirmPassword,
  }) {
    emit(NewPasswordLoadingState());

    dio_helper
      .postData(url: '$BaseAPI/api/ApplicationUser/ForgetPassword', query: {
      'Email': email,
      'NewPassword': newPassword,
      'ConfirmPassword': confirmPassword,
    }, data: {
      'Email': email,
      'NewPassword': newPassword,
      'ConfirmPassword': confirmPassword,
    }).then((value) {
      if (value?.statusCode == 200) {
        emit(NewPasswordSuccessState(email, newPassword, confirmPassword));
      } else {
        print(value?.data);
        emit(NewPasswordErrorState('Status code: ${value?.statusCode}'));
      }
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
    if (isvisiable2) {
      icon2 = Icons.visibility;
      isvisiable2 = !isvisiable2;
    } else {
      icon2 = Icons.visibility_off;
      isvisiable2 = !isvisiable2;
    }
    emit(NewPasswordVisiablityIconState());
  }
}
