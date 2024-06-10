import 'package:medica/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessgState extends LoginState {
  final LoginModel? model;
  final int? statusCode;

  LoginSuccessgState(this.model, this.statusCode);
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState(this.error);
}

class VisiablityIconState extends LoginState {}

// Logout state
class LogoutState extends LoginState {
  //remove token from shared preferences
  
}
