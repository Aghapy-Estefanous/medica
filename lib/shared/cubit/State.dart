import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/models/basicDtataModel.dart';
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
//......................********* here states for department ***********................
class GetAllDepartmentLoadingState extends AppState {}

class GetAllDepartmentSuccessState extends AppState {
  // final UserReservationModel? modelReservation;
  // ReservationSuccessState(this.modelReservation);
}

class GetAllDepartmentErrorState extends AppState {
  final dynamic error;
  GetAllDepartmentErrorState(this.error);
}
class chnageButtonDepartmenTColor extends AppState {}
//......................********* here states for all clinics of department ***********................
class GetAllClinicsDepartmentLoadingState extends AppState {}

class GetAllClinicsDepartmentSuccessState extends AppState {
  // final UserReservationModel? modelReservation;
  // ReservationSuccessState(this.modelReservation);
}

class GetAllClinicsDepartmentErrorState extends AppState {
  final dynamic error;
  GetAllClinicsDepartmentErrorState(this.error);
}
//......................********* here states for all clinics   for home ui ***********................
class GetAllClinicsLoadingState extends AppState {}

class GetAllClinicsSuccessState extends AppState {
  // final UserReservationModel? modelReservation;
  // ReservationSuccessState(this.modelReservation);
}

class GetAllClinicsErrorState extends AppState {
  final dynamic error;
  GetAllClinicsErrorState(this.error);
}
//......................********* here states for all diseases   for medical h drop down ***********................
class GetAllDiseasesLoadingState extends AppState {}

class GetAllDiseasesSuccessState extends AppState {
  // final UserReservationModel? modelReservation;
  // ReservationSuccessState(this.modelReservation);
}

class GetAllDiseasesErrorState extends AppState {
  final dynamic error;
  GetAllDiseasesErrorState(this.error);
}

//................................post diseases
class PostDiseasesLoading extends AppState {}

class PostDiseasesSuccess extends AppState {
  final succeeded; 
  PostDiseasesSuccess(this.succeeded);
}

class PostDiseasesError extends AppState {
  final dynamic error;
  PostDiseasesError(this.error);
}
//............................... diseases
class DiseasePhotoSelectedstate extends AppState {
  final file;
  DiseasePhotoSelectedstate(this.file );
}


class DiseasePhotoSelectionErrorstate extends AppState {
  final dynamic error;
  DiseasePhotoSelectionErrorstate(this.error);
}

//...............................user basic data
class getBasicDataLoading extends AppState {}

class getBasicDataSuccess extends AppState {
  final  model; 
  getBasicDataSuccess(this.model);
}

class getBasicDataError extends AppState {
  final dynamic error;
  getBasicDataError(this.error);
}
// ...................................for file picker
class YourCubitInitial extends AppState {}

class YourCubitFilePicked extends AppState {
  final FilePickerResult file;

  YourCubitFilePicked(this.file);
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


