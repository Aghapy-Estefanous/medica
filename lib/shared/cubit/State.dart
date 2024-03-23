import 'package:medica/models/reservationModel.dart';

abstract class AppState {}

class InitialState extends AppState {}

class ChangeBottomNavigateBarState extends AppState {}

// reservation states..............................func1
class ReservationLoadingState extends AppState {}

class ReservationSuccessState extends AppState {
  final UserReservationModel? modelReservation;
  ReservationSuccessState(this.modelReservation);
}

class ReservationErrorState extends AppState {
  final dynamic error;
  ReservationErrorState(this.error);
}




//class shopInitialState extends shopState {}

// class shopHomeLoadingState extends shopState {}

// class shopHomeSuccessgState extends shopState {
//   MyHomeModel? model;
//   shopHomeSuccessgState(this.model);
// }

// class shopHomeErrorState extends shopState {
//   final String error;
//   shopHomeErrorState(this.error);
// }




//user data states
// class GetUserLoadingState extends shopState {}

// class GetUserSuccessState extends shopState {
//   UserModel model;
//   GetUserSuccessState(this.model);
// }

// class GetUserErrorState extends shopState {
//   final String error;
//   GetUserErrorState(this.error);
// }
//user data states
// class RegisterLoadingState extends shopState {}
// class RegisterSuccessState extends shopState {
//    loginModel? model;
//    RegisterSuccessState(this.model);

  
// }

// class RegisterErrorState extends shopState {
//   final String error;
//   RegisterErrorState(this.error);
// }
//    class RsgisterVisiablityIconState extends shopState{}


