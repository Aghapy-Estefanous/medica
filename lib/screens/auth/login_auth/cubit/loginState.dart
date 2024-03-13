import 'package:medica/models/login_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessgState extends LoginState {
  LoginModel? model;
  int? StatusCode;
  LoginSuccessgState(this.model,this.StatusCode);
}
//@@Doa2@@

class LoginErrorState extends LoginState {
  //LoginModel? model;
   var error;
  // final String StatusCodeInt;
  LoginErrorState(this.error);
}

class VisiablityIconState extends LoginState {}