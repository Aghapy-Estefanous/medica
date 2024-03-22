// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'new_password_cubit.dart';

@immutable
sealed class NewPasswordState {}

final class NewPasswordInitial extends NewPasswordState {}

class NewPasswordLoadingState extends NewPasswordState {}

class NewPasswordSuccessState extends NewPasswordState {
  String email;
  String newPassword;
  String confirmPassword;
  NewPasswordSuccessState(
    this.email,
    this.newPassword,
    this.confirmPassword,
  );
}

class NewPasswordErrorState extends NewPasswordState {
  final String error;
  NewPasswordErrorState(this.error);
}

class NewPasswordVisiablityIconState extends NewPasswordState {}
