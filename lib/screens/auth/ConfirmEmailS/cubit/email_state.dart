part of 'email_cubit.dart';

@immutable
sealed class EmailState {}

final class EmailInitial extends EmailState {}

class EmailLoadingState extends EmailState {}

class EmailSuccessgState extends EmailState {
  // LoginModel? model;
  //int? StatusCode;
  String email;
  EmailSuccessgState(this.email);
}

class EmailErrorState extends EmailState {
  final String error;
  EmailErrorState(this.error);
}

class VisiablityIconState extends EmailState {}
