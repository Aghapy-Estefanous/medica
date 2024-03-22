import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/main.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'package:meta/meta.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitial());

  static EmailCubit get(context) => BlocProvider.of(context);

  void Email({
    required String email,
  }) {
    emit(EmailLoadingState());

    dio_helper.postData(url: '$BaseAPI/api/Mailing/send', query: {
      'ToEmail': email,
    }, data: {
      // 'ToEmail': email,
    }).then((value) {
      print(value!.data);
      // int? StatusCode=value.statusCode;
      // LoginModel CURRENT_USER = LoginModel.fromJson(value.data);
      print("  message from me${value.data}");
      if (value.statusCode == 200)
        emit(EmailSuccessgState(email));
      else {
        print("Status code : ${value.statusCode}");

        emit(EmailErrorState(value.statusMessage!));
      }
    }).catchError((error) {
      print(" error here$error");
      if (error is DioException) {
        print("HTTP Error Status Code: ${error.response?.statusCode}");
        emit(EmailErrorState(error.response!.statusCode as String));
      } else {
        print("Non-HTTP Error: $error");
        // Handle non-HTTP errors here
      }
    });
  }
}
