import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/models/clinicModel.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/core/api/apiConsumer.dart';
import 'package:medica/screens/splash_screen.dart';
import 'package:medica/models/departmentModel.dart';
import 'package:medica/core/errors/Exceptions.dart';
import 'package:medica/models/reservationModel.dart';
import 'package:medica/screens/home/home_screen.dart';

import 'package:medica/shared/network/remote/endpoint.dart';
import 'package:medica/screens/reservation/ticketScreen.dart';
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
        label: "Categories",
        icon: Icon(
          Icons.category,
        )),
    NavigationDestination(
        label: "Labs",
        icon: Icon(
          Icons.library_books_outlined,
        )),
    // NavigationDestination(
    //     label: "Reservation",
    //     icon: Icon(
    //       Iconsax.tick_circle,
    //     )),
    NavigationDestination(
        label: "medical history",
        icon: Icon(
          Icons.settings,
        )),
  ];
  List<Widget> Screen = [
    Home_Screen(),
    SplashScreen(),
    Testing(),
    MedicalHistoryScreen(),
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

  late List<Data>? alldepartmentslist = [];

  GetAllDepartments() async {
    try {
      late DepartmentsModel departmentsModel;
      emit(GetAllDepartmentLoadingState());

      var response = await api.get(
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
      
      var filterParameter ="departmentID=$Did";
        String xx= Endpoint.BaseUrl + Endpoint.ALLCLINICS +"filter=$filterParameter";
      print(xx);
      var response = await api.get(
        Endpoint.BaseUrl + Endpoint.ALLCLINICS +"?filter=$filterParameter",
      );
    
      Model = ClinicModel.fromJson(response);
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

      var response = await api.get(
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
      
      var filterParameter ="name=$searchWord";
      var response = await api.get(
        Endpoint.BaseUrl + Endpoint.ALLCLINICS +"?filter=$filterParameter",
      );
    
      Model = ClinicModel.fromJson(response);
      SearchResponseList?.clear();
      SearchResponseList = Model.data;
      print(Model.data);
      print("list :${SearchResponseList?.length}");
      print("from cubit :${SearchResponseList?[0].name}");

      emit(GetAllDepartmentSuccessState());
    } on ServerExceptions catch (e) {
      print(e.toString());
      emit(GetAllDepartmentErrorState(e.errorModel.message));
    }
  }
}
/*
  late UserReservationModel modelReservation;
  void getReservationdata() async {
    emit(ReservationLoadingState());

    dio_helper
        .getData(
      url:
          'http://medicalsystem-001-site1.ftempurl.com/api/Reservation/UserReservations', //BaseUrl+USER_RESERVATION,
      AccessToken:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJEb2FhR2FtYWwiLCJqdGkiOiJkYzM3NTdiZi1jMmRlLTQwOWEtYjQ0OC1kODI1YzU3NmZhMzQiLCJlbWFpbCI6ImRvYWEyMkBnbWFpbC5jb20iLCJ1aWQiOiIxMjM0NTY3ODkxMDExIiwicm9sZXMiOiJVc2VyIiwiZXhwIjoxNzEzMjEyNDkyfQ.-HnqeRVbDAK8faez5N66WMSdVhxCBwJW-snLYb165qw',
    )
        .then((value) {
      print("form reserv object");
      print(json.encode(value!.data));
      modelReservation = UserReservationModel.fromJson(value?.data);
      CachHelper.Savedata(
          key: 'reservationId', value: modelReservation.data?[0].id);
      print(modelReservation.data?[0].id);
      emit(ReservationSuccessState(modelReservation));
    }).catchError((error) {
      ReservationErrorState(error.toString());
    });
      **************************************here end/
  



  // //func2
  // late ReservationInfoModel modelReservationInfo;

  // void getReservationInfoData() {
  //   emit(ReservationInfoLoadingState());
  //   // var CurrentToken =
  //   //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJEb2FhR2FtYWwiLCJqdGkiOiIxZThkZjVhYS0zYTFjLTRmNGYtYWY2NS1iYWM3ZWRmOTEwZGUiLCJlbWFpbCI6IkRvYWFAZ2FtaWwuY29tIiwidWlkIjoiY2MxNjg0ZWMtZjQxNC00NTI1LWIxMmQtNTQwYWQxOWZjNWFhIiwicm9sZXMiOiJVc2VyIiwiZXhwIjoxNzEzMDA5NjQ2fQ.5JPQo7HWoI0Jz8EW3coE1ytUdgKzjL1zGJG_R6lmKxw';

  //   dio_helper.getData(
  //       url: BaseUrl+USER_RESERVATION,
  //       AccessToken: CachHelper.getdata(key: 'token'),
  //       query: {}).then((value) {
  //     print(value?.data);
  //     modelReservationInfo = ReservationInfoModel.fromJson( value?.data);
  //     emit(ReservationInfoSuccessState(modelReservationInfo));
  //   }).catchError((error) {
  //     ReservationInfoErrorState(error.toString());
  //   });
  // }
}

  // Map<int, bool> favoriteMap = {};
  // void getHomeData() {
  //   emit(shopHomeLoadingState());

  //   dio_helper.getData(url: Home, query: null, token: token).then((value) {
  //     // print(value!.data);
  //     //instead constructor use named constructor to assign fast 💥
  //     homeModel = MyHomeModel.fromJson(value!.data);
  //     //from model  can access to anything in it 💥
  //     homeModel!.data.products.forEach(((e) {
    
  //         favoriteMap.addAll(Map<int, bool>.from({e.id: e.in_favorites}));
        
  //     }));
      // for(int i=0;i<homeModel!.data.products.length;i++){
      //    favoriteMap.addAll(Map<int, bool>
      //    .from({homeModel!.data.products[i].id:
      //     homeModel!.data.products[i].in_favorites}));
      // }

  //     print(homeModel!.data.products[0].id);
  //     print(favoriteMap.toString());
  //     emit(shopHomeSuccessgState(homeModel));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(shopHomeErrorState(error.toString()));
  //   });
  // }
///....................................................................

  // getCategoriesData() {
  //   emit(shopCategoriesLoadingState());

  //   dio_helper.getData(url: Get_Categories, query: null).then((value) {
  //     // print(value!.data);
  //     categoriesModel = CategoriesModel.fromJson(value!.data);
  //     // print(categoriesModel!.data[0].name);
  //     emit(shopCategoriesSuccessgState(categoriesModel));
  //   }).catchError((e) {
  //     print(e.toString());
  //     emit(shopCategoriesErrorState(e.toString()));
  //   });
  // }

  // FavoritesModel? favoritesModel;
  // void ChangeToFavorites({required  productId}) {
  //   // تغير لحظي والحقيقي بيحصل في الباك جراوند
  //   favoriteMap[productId!] = !favoriteMap[productId]!;
  //   emit(ChangeToFavoritesState()); //emit 3shaan y7sl intime!
  //   dio_helper
  //       .postData(
  //           url: 'favorites', data: {'product_id': productId}, token: token)
  //       .then((value) {
  //     favoritesModel = FavoritesModel.fromjason(value!.data);
  //     if (favoritesModel!.status == false) {
  //       favoriteMap[productId] = !favoriteMap[productId]!;
  //       //ارجع زي م كنت في حاله
  //     } else {
  //       //success delete or add
  //       getFavoritesData();
  //     }
  //     emit(ChangeToFavoritesSuccessState(favoritesModel!));
  //     print("add is done");
  //   }).catchError((error) {
  //     print(error.toString());
  //     //ارجع زي م كنت في حاله
  //     favoriteMap[productId] = !favoriteMap[productId]!;

  //     emit(ChangeToFavoritesErrorState(error.toString()));
  //   });
  // }

  // GetFavoritesModel? getFavoritesModel;
  // getFavoritesData() {
  //   emit(GetUserLoadingState());

  //   dio_helper
  //       .getData(
  //     url: 'favorites',
  //     token: token,
  //   )
  //       .then((value) {
  
  //     getFavoritesModel = GetFavoritesModel.fromJson(value!.data);
  //     print("getfavmode");
  //      print(value!.data);
  //     print("getfavmode");
     
     
  //      print("fav data get fuc ${token}");

      
  //     emit(GetFavoritesSuccessState(getFavoritesModel!));
  //   }).catchError((e) {
  //     print(e.toString());
  //     emit(GetFavoritesErrorState(e.toString()));
  //   });
  // }

  // loginModel? userModel;
 
  // getUserData() {
  //   emit(GetUserLoadingState());

  //   dio_helper
  //       .getData(
  //     url: PROFILE,
  //     token: token,
  //   )
  //       .then((value) {
  //     print(value!.data);
        
  //     //UserModel = UserModel.fromJson(value!.data);
  //     userModel = loginModel.fromjason(value.data);
  //     print('userdata is token is'+token.toString());
  //     emit(GetUserSuccessState(userModel!.data!));
  //   }).catchError((e) {
  //     print(e.toString());
  //     emit(GetUserErrorState(e.toString()));
  //   });
  // }

  // loginModel? LoginModel;
  // postRegiserData(image,
  //     {required name, required phone, required email, required password}) {
  //   emit(RegisterLoadingState());
  //   dio_helper.postData(url: REGISTER, data: {
  //     'name': name,
  //     'phone': phone,
  //     'email': email,
  //     'password': password,
  //     'image': image,
  //   }).then((value) {
  //   print(token);
  //     LoginModel = loginModel.fromjason(value!.data);
  //       print(token);
  //     emit(RegisterSuccessState(LoginModel));
  //   }).catchError((e) {
  //     print(e.toString());
  //     emit(RegisterErrorState(e.toString()));
  //   });
  // }
  
  //for register
  //VisiablityIconState
//     bool isvisiable=false;
//     IconData icon= Icons.visibility;
//     void ChangeVisiablityIcon(){
//        if(isvisiable) 
//        {
//         icon=Icons.visibility_off;
//         isvisiable=!isvisiable; //false
//        }
//        else{
//         icon= Icons.visibility;
//         isvisiable=!isvisiable;
//        }
//        emit(RsgisterVisiablityIconState ());
//     }

*/
