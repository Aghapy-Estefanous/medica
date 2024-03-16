import 'package:bloc/bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/State.dart';
import 'package:medica/screens/splash_screen.dart';
import 'package:medica/models/reservationModel.dart';
import 'package:medica/screens/home/home_screen.dart';
import 'package:medica/shared/network/remote/endpoint.dart';
import 'package:medica/screens/reservation/ticketScreen.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
// import 'package:medica/screens/auth/loginS/loginS.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
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
        label: "Reservation",
        icon: Icon(
          Iconsax.tick_circle,
        )),
    NavigationDestination(
        label: "settings",
        icon: Icon(
          Icons.settings,
        )),
  ];
  List<Widget> Screen = const [
    Home_Screen(),
    Splash_screen(),

    TicketScreen(),
    TicketScreen(),
    // produts_screen(),
    // //shopHome_screen(),
    // categories_screen(),
    // favorites_screen(),
    // settings_screen(),
  ];
  // MyHomeModel? homeModel;
  // CategoriesModel? categoriesModel;
  int currentIndex = 0;
  ChangeBottomNavigateBar({required index}) {
    currentIndex = index;
    emit(ChangeBottomNavigateBarState());
  }

//
  void getReservationdata() {
    emit(ReservationLoadingState());
    var CurrentToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJEb2FhR2FtYWwiLCJqdGkiOiIxZThkZjVhYS0zYTFjLTRmNGYtYWY2NS1iYWM3ZWRmOTEwZGUiLCJlbWFpbCI6IkRvYWFAZ2FtaWwuY29tIiwidWlkIjoiY2MxNjg0ZWMtZjQxNC00NTI1LWIxMmQtNTQwYWQxOWZjNWFhIiwicm9sZXMiOiJVc2VyIiwiZXhwIjoxNzEzMDA5NjQ2fQ.5JPQo7HWoI0Jz8EW3coE1ytUdgKzjL1zGJG_R6lmKxw';

    dio_helper
        .getData(url: USER_RESERVATION, AccessToken: CurrentToken)
        .then((value) {
      print(value?.data);
    });
    emit(ReservationLoadingState());
    UserReservationModel? RservationModel;
  }
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

// }
