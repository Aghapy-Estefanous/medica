// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'confirm_email_cubit.dart';

@immutable
sealed class ConfirmEmailState {}

final class ConfirmEmailInitial extends ConfirmEmailState {}


class ConfirmEmailLoadingState extends ConfirmEmailState {}

class ConfirmEmailSuccessgState extends ConfirmEmailState {
  // LoginModel? model;
  //int? StatusCode;
  String ConfirmEmail;
  String Email;
  ConfirmEmailSuccessgState(
    this.ConfirmEmail,
    this.Email,
  );
}

class ConfirmEmailErrorState extends ConfirmEmailState {
  final String error;
  ConfirmEmailErrorState(this.error);
}

class VisiablityIconState extends ConfirmEmailState {}
