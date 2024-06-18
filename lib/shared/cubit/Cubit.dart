import 'package:dio/dio.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/models/clinicModel.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/core/api/apiConsumer.dart';
import 'package:medica/screens/splash_screen.dart';
import 'package:medica/core/errors/Exceptions.dart';
import 'package:medica/models/basicDtataModel.dart';
import 'package:medica/models/departmentModel.dart';
import '../../screens/static_pages/Cares/alls.dart';
import 'package:medica/models/AllDiseasesModel.dart';
import 'package:medica/models/reservationModel.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/screens/auth/Profile/profile.dart';
import 'package:medica/models/user/AllDiseasesOfUser.dart';
import 'package:medica/shared/network/remote/endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medica/screens/static_pages/testing/testing.dart';
import 'package:medica/screens/medical_history/medical_history.dart';


// import 'package:medica/screens/auth/loginS/loginS.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.api) : super(InitialState());

  final ApiConsumer api;
  // get instance of App cubit
  static AppCubit get(context) => BlocProvider.of(context);
  List<NavigationDestination> BottomNavItems = const [
    NavigationDestination(
        label: "Home",
        icon: Icon(
          Iconsax.home,
        )),
    NavigationDestination(
        label: "Aids",
        icon: Icon(
          Icons.medical_information_outlined,
        )),
    NavigationDestination(
        label: "Labs",
        icon: Icon(
          Icons.library_books_outlined,
        )),
    NavigationDestination(
        label: "profile",
        icon: Icon(
          Icons.person,
        )),
    NavigationDestination(
        label: "medical history",
        icon: Icon(
          Icons.settings,
        )),
  ];
  List<Widget> Screen = [
    const Home_Screen(),
    // const SplashScreen(),
    CareScreen(),
    Testing(),
    const ProfileScreen(),
    const MedicalHistoryScreen(),
  ];
  // MyHomeModel? homeModel;
  // CategoriesModel? categoriesModel;
  int currentIndex = 0;
  ChangeBottomNavigateBar({required index}) {
    currentIndex = index;
    emit(ChangeBottomNavigateBarState());
  }

// reserve method1
  List<DataUserReservation>? myReservationsList = [];
  getdata() async {
    try {
      late UserReservationModel modelReservation;
      emit(ReservationLoadingState());
      var response = await api.get(
        Endpoint.BaseUrl + Endpoint.REGISTER,
      );
      // print(response.data);
      modelReservation = UserReservationModel.fromJson(response);
      myReservationsList = modelReservation.data;
      print(modelReservation.data?[0].firstname);

      emit(ReservationSuccessState(modelReservation));
    } on ServerExceptions catch (e) {
      print(e.toString());
      emit(ReservationErrorState(e.errorModel.message));
    }
  }

//   *******get all department for home**************

  late List<Data>? alldepartmentslist = [
    //DataDepartment(id: 12,name: "test department")
  ];

  GetAllDepartments() async {
    try {
      late DepartmentsModel departmentsModel;
      emit(GetAllDepartmentLoadingState());

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('Token');
      var response = await api.getWithqueryParameter(
        Endpoint.BaseUrl + Endpoint.ALLDEPARTMENTS,
      );
      // print(response.data);
      departmentsModel = DepartmentsModel.fromJson(response);
      alldepartmentslist = departmentsModel.data;
      print(departmentsModel.data?[0].name);

      emit(GetAllDepartmentSuccessState());
    } on ServerExceptions catch (e) {
      print(e.toString());
      emit(GetAllDepartmentErrorState(e.errorModel.message));
    }
  }

  //.........................to chnage color button department
  //Color DepartmentButtonColor = AppColor.orangcolor;
  int indxSelected = 0;
  currentDepartment(int index) {
    indxSelected = index;
    emit(chnageButtonDepartmenTColor());
  }

//............................. get all cilics of a department
  late List<DataClinic>? allClinicsOfDepartmentslist = [
    //DataClinic(id: 12,name: "test clinic")
  ];

  GetAllClinicOfDepartments(int? Did) async {
    try {
      late ClinicModel Model;
      emit(GetAllDepartmentLoadingState());

      var filterParameter = "departmentID=$Did";
      String xx =
          "${Endpoint.BaseUrl}${Endpoint.ALLCLINICS}filter=$filterParameter";
      print(xx);

      var response = await api.getWithqueryParameter(
        "${Endpoint.BaseUrl}${Endpoint.ALLCLINICS}?filter=$filterParameter",
      );

      Model = ClinicModel.fromJson(response as Map<String, dynamic>);
      print(Model);
      allClinicsOfDepartmentslist?.clear();
      allClinicsOfDepartmentslist = Model.data;
      print(Model.data);
      print("list :${allClinicsOfDepartmentslist?.length}");
      print("from cubit :${allClinicsOfDepartmentslist?[0].name}");

      emit(GetAllDepartmentSuccessState());
    } on ServerExceptions catch (e) {
      print(e.toString());
      emit(GetAllDepartmentErrorState(e.errorModel.message));
    }
  }

//............................. get all cilics (home)
  late List<DataClinic>? allClinicslist = [];

  GetAllClinics() async {
    try {
      late ClinicModel clinicModel;
      emit(GetAllClinicsLoadingState());

      var response = await api.getWithqueryParameter(
        Endpoint.BaseUrl + Endpoint.ALLCLINICS,
      );

      clinicModel = ClinicModel.fromJson(response);
      allClinicslist = clinicModel.data;

      print("list :${allClinicslist?.length}");
      print("from cubit :${allClinicslist?[0].name}");

      emit(GetAllClinicsSuccessState());
    } on ServerExceptions catch (e) {
      print(e.toString());
      emit(GetAllClinicsErrorState(e.errorModel.message));
    }
  }

  //..............................search functon..........................
  late List<DataClinic>? SearchResponseList = [
    //DataClinic(id: 12,name: "test clinic")
  ];

  ScearchFunction(String searchWord) async {
    try {
      late ClinicModel Model;
      emit(GetAllDepartmentLoadingState());

      var filterParameter = "name=$searchWord";
      var response = await api.getWithqueryParameter(
        "${Endpoint.BaseUrl}${Endpoint.ALLCLINICS}?filter=$filterParameter",
      );

      Model = ClinicModel.fromJson(response);
      SearchResponseList?.clear();
      SearchResponseList = Model.data;
      print(Model.data);
      print("list :${SearchResponseList?.length}");
      print("from cubit :${SearchResponseList?[0].name}");

      emit(GetAllDepartmentSuccessState());
    } catch (e) {
      print(e.toString());
      emit(GetAllDepartmentErrorState(e.toString()));
    }
  }

  //.........................to chnage color button department
  //Color DepartmentButtonColor = AppColor.orangcolor;
  singleDiseasObjectData? SelectedDisease;
  currentDiseaseObject(singleDiseasObjectData index) {
    SelectedDisease = index;
    emit(chnageButtonDepartmenTColor());
  }

  //.............get all diseases for drop down in form post disases..........................
  
  List<singleDiseasObjectData>? ALLDiseasesList = [];
  Alldiseases? Model2;

  getALLDiseases2() async {
    try {
      emit(GetAllDiseasesLoadingState());

      var response = await api.getWithqueryParameter(
          Endpoint.BaseUrl + Endpoint.All_POSSIBL_EDISEASES);
      print('🌍🟢🟢????????  Alldiseases? response: $response');
      Model2 = Alldiseases.fromJson(response);
      ALLDiseasesList = Model2?.data;
      // print('🌍🟢🟢 all diseases: $ALLDiseasesList');
      print(Model2?.data);

      emit(GetAllDiseasesSuccessState());
    } catch (e) {
      print("error  diseases  ❌⭕ ${e.toString()}");
      emit(GetAllDiseasesErrorState(e.toString()));
    }
  }

  //🟢🟢🟢🟢🟢🟢🟢🟢🟢🟢................... All diseases of user.............🟢🟢🟢🟢🟢🟢......
  int LengthOfAllUserDiseasesList = 0;
  late List<DiseasesOfUser> AllUserDiseasesList = [];
  AllDiseasesOfUserModel? Model;
  getAllUserDiseases() async {
    try {
      emit(GetAllDiseasesLoadingState());

      var response = await api.getWithqueryParameter(
        Endpoint.BaseUrl + Endpoint.USER_Disease,
      );

      Model = AllDiseasesOfUserModel.fromJson(response);
      AllUserDiseasesList = Model!.data!;
      LengthOfAllUserDiseasesList = AllUserDiseasesList.length;
      print("user dieases now get✅✅🟢${AllUserDiseasesList}");
      emit(GetAllDiseasesSuccessState());
    } catch (e) {
      // print(e.toString());
      print("error in user dieases🚨 $e");
      emit(GetAllDiseasesErrorState(e.toString()));
    }
  }
 

//  int updateLength() {
//   emit(UpdateLengthState());
//  return  LengthOfAllUserDiseasesList = AllUserDiseasesList.length;
//    // print("💤💥Notify UI to update ${LengthOfAllUserDiseasesList}") ;

// }
 // Initialize with 0 initially

  //................................. setstate current image picker.....

  XFile? imagePathFromgallary;
  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedImage != null) {
      imagePathFromgallary = pickedImage;
      print("🟢🟢🟢upload image successfuly🟢🟢🟢");
      DiseasePhotoSelectedstate();
    }
  }

  double? lastUserHeight;
  double? lastUserWeight;

  Future<dynamic> postFormData2(
    String type,
    String description,
    String diagnosis, {
    required String nid,
    required DateTime dateOfDiagonsises,
    required double valueResult,
    required double height,
    required double weight,
  }) async {
    emit(PostDiseasesLoadingS());
    FormData formData = FormData.fromMap({
      'Photo': await MultipartFile.fromFile(imagePathFromgallary!.path),
    });

    await api
        .postAsFormData(
      apiUrl: Endpoint.ADD_DISEASE(
        diseaseType: type,
        diseaseValueResult: valueResult,
        diseaseDescription: description,
        disease: diagnosis,
        diseaseUsrId: nid,
        diseaseHeight: height,
        diseaseWeight: weight,
        diseaseId: SelectedDisease?.id == null ? 1 : SelectedDisease!.id!,
        diseaseDate: dateOfDiagonsises.toIso8601String(),
      ),
      data: formData,
    )
        .then((dynamic value) {
     LengthOfAllUserDiseasesList = AllUserDiseasesList.length;
      emit(PostDiseasesSuccessS());
      if (value != null) {
        print("🚨 data after send it $value 🌍");
      }
    }).catchError((e) {
      print("error in function🚨 $e");
      emit(PostDiseasesErrorS(e.toString()));
    });
  }

  //.............get basic data..........................

  BasicDataModel? basicDataModel;
  Future getBasicData() async {
    emit(GetBasicDataLoadingState());
    await api.get(Endpoint.BASIC_DATA).then((value) {
      print('🌍 get basic data done!');

      print('🌍Basic Data: $value}');
      basicDataModel = BasicDataModel.fromJson(value);
      emit(GetBasicDataSuccessState());
    }).catchError((error) {
      print("🚨Error to get the basic data=> $error");
      emit(GetBasicDataErrorState(error.toString()));
    });
  }
}
