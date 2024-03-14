import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'package:meta/meta.dart';

import '../../../../main.dart';

part 'confirm_email_state.dart';

class ConfirmEmailCubit extends Cubit<ConfirmEmailState> {
  ConfirmEmailCubit() : super(ConfirmEmailInitial());

  static ConfirmEmailCubit get(context) => BlocProvider.of(context);

  void Email({
    required String Email,
    required String OTP,
  }) {
    emit(ConfirmEmailLoadingState());

    dio_helper.postData(url: '$BaseAPI/api/Mailing/verify-otp', query: {
      'Email': Email,
      'EnteredOTP': OTP,
    }, data: {
      // 'ToEmail': email,
    }).then((value) {
      print(value!.data);
      // int? StatusCode=value.statusCode;
      // LoginModel CURRENT_USER = LoginModel.fromJson(value.data);
      print("  message from me${value.statusCode}");
      if (value.statusCode == 200) {
        emit(ConfirmEmailSuccessgState(OTP, Email));
      } else {
        emit(ConfirmEmailErrorState('Status code: ${value.statusCode}'));
      }
    }).catchError((error) {
      print(" error here$error");
      emit(ConfirmEmailErrorState(error.toString()));
    });
  }
}
