part of 'new_password_cubit.dart';

@immutable
sealed class NewPasswordState {}

final class NewPasswordInitial extends NewPasswordState {}
class NewPasswordLoadingState extends NewPasswordState {}


class NewPasswordSuccessState extends NewPasswordState {
  LoginModel? model;
  NewPasswordSuccessState(this.model);
}

class NewPasswordErrorState extends NewPasswordState {
  final String error;
  NewPasswordErrorState(this.error);
}

class NewPasswordVisiablityIconState extends NewPasswordState {}