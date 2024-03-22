import 'package:medica/models/login_model.dart';

abstract class RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  LoginModel? model;
  RegisterSuccessState(this.model);
}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
}

class RsgisterVisiablityIconState extends RegisterState {}

// class RsgisterVisiablityIconState2 extends RegisterState {}
