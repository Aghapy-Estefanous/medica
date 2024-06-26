import 'package:medica/models/reservationModel.dart';

abstract class AppState {}

class InitialState extends AppState {}

class ChangeBottomNavigateBarState extends AppState {}

// reservation states..............................func1
class ReservationLoadingState extends AppState {}

class ReservationSuccessState extends AppState {
  //final UserReservationModel? modelReservation;
  ReservationSuccessState();
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
//......................*********search for home ui ***********................
class SearchLoadingState extends AppState {}

class SearchSuccessState extends AppState {
  // final UserReservationModel? modelReservation;
  // ReservationSuccessState(this.modelReservation);
}

class SearchErrorState extends AppState {
  final dynamic error;
  SearchErrorState(this.error);
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
class PostDiseasesLoadingS extends AppState {}

class PostDiseasesSuccessS extends AppState {}

class PostDiseasesErrorS extends AppState {
  final dynamic error;
  PostDiseasesErrorS(this.error);
}

//............................... photo diseases
class DiseasePhotoSelectedstate extends AppState {
  DiseasePhotoSelectedstate();
}

class DiseasePhotoSelectionErrorstate extends AppState {
  final dynamic error;
  DiseasePhotoSelectionErrorstate(this.error);
}

//...............................user basic data
class GetBasicDataLoadingState extends AppState {}

class GetBasicDataSuccessState extends AppState {
  GetBasicDataSuccessState();
}

class GetBasicDataErrorState extends AppState {
  final String error;
  GetBasicDataErrorState(this.error);
}

//...................................cubit for PostDiseaseLoadingState...................................
class PostDiseaseLoadingState extends AppState {}

class PostDiseaseSuccessState extends AppState {}

class PostDiseaseErrorState extends AppState {
  // final dynamic error;
  // PostDiseaseErrorState(this.error);
}

class UpdateLengthState extends AppState {}
//  ✅ 💥 ✅  check for connections
class AppConnectedState extends AppState{}

class AppNoInternetState extends AppState{}


