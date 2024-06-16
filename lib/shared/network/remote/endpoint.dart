const BaseUrl = 'http://medicalsystem.runasp.net/api/';
const LOGIN = 'Auth/LogIn';
const REGISTER = 'Auth/register';

const USER_RESERVATION = '/api/Reservation/UserReservations';
const ReservationINFO = 'Reservation/ReservationINFO/15';

class Endpoint {
  Endpoint._();
  static const BaseUrl = 'http://medicalsystem.runasp.net/api/';
  static const LOGIN = 'Auth/LogIn';
  static const REGISTER = 'Auth/register';
  static const USER_RESERVATION = 'Reservation/UserReservations';
  static const ALLDEPARTMENTS = 'Department/All-Departments';
  static const ALLCLINICS_OF_DEPARTMENTS = 'Clinic/GetAllClinicsWthDeptId/';
  static const ALLCLINICS = 'Clinic/All-Clinics';
  static String ADD_DISEASE({
    required String diseaseType,
    required double diseaseValueResult,
    required String diseaseDescription,
    required String disease,
    required String diseaseUsrId,
    required double diseaseHeight,
    required double diseaseWeight,
    required int diseaseId,
    required String diseaseDate,
  }) =>
      'ApplicationUserDisease?type=$diseaseType&valueResult=$diseaseValueResult&description=$diseaseDescription&diagnosis=$disease&userId=$diseaseUsrId&height=$diseaseHeight&weight=$diseaseWeight&diseaseId=$diseaseId&diagnosisDate=$diseaseDate';
  static const BASIC_DATA = 'ApplicationUser/BasicData';
  static const All_POSSIBL_EDISEASES = 'Disease';
  static const USER_Disease = 'ApplicationUser/GetAllDiseaseOfUser';
 
}
//http://medicalsystem-001-site1.ftempurl.com
//Authorization : 'Bearer ${AccessToken}'
// const Get_Categories ='categories';
// const FAVORITES ='Favorites';
// const PROFILE ='profile';
// const REGISTER ='register';
// const SEARCH ='products/search';