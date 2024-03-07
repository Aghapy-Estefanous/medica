import 'package:medica/models/login_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessgState extends LoginState {
  LoginModel? model;
  //int? StatusCode;
  LoginSuccessgState(this.model);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}

class VisiablityIconState extends LoginState {}