import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/cubit/State.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitialState());
  // get instance of App cubit
  static AppCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> BottomNavItems = const [
    BottomNavigationBarItem(
        label: "Home",
        icon: Icon(
          Icons.home,
        )),
    BottomNavigationBarItem(
        label: "Categories",
        icon: Icon(
          Icons.category,
        )),
    BottomNavigationBarItem(
        label: "Favorites",
        icon: Icon(
          Icons.favorite,
        )),
    BottomNavigationBarItem(
        label: "settings",
        icon: Icon(
          Icons.settings,
        )),
  ];
  List<Widget> Screen = const [
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

  Map<int, bool> favoriteMap = {};
  void getHomeData() {
    emit(shopHomeLoadingState());

    dio_helper.getData(url: Home, query: null, token: token).then((value) {
      // print(value!.data);
      //instead constructor use named constructor to assign fast 💥
      homeModel = MyHomeModel.fromJson(value!.data);
      //from model  can access to anything in it 💥
      homeModel!.data.products.forEach(((e) {
    
          favoriteMap.addAll(Map<int, bool>.from({e.id: e.in_favorites}));
        
      }));
      // for(int i=0;i<homeModel!.data.products.length;i++){
      //    favoriteMap.addAll(Map<int, bool>
      //    .from({homeModel!.data.products[i].id:
      //     homeModel!.data.products[i].in_favorites}));
      // }

      print(homeModel!.data.products[0].id);
      print(favoriteMap.toString());
      emit(shopHomeSuccessgState(homeModel));
    }).catchError((error) {
      print(error.toString());
      emit(shopHomeErrorState(error.toString()));
    });
  }

  getCategoriesData() {
    emit(shopCategoriesLoadingState());

    dio_helper.getData(url: Get_Categories, query: null).then((value) {
      // print(value!.data);
      categoriesModel = CategoriesModel.fromJson(value!.data);
      // print(categoriesModel!.data[0].name);
      emit(shopCategoriesSuccessgState(categoriesModel));
    }).catchError((e) {
      print(e.toString());
      emit(shopCategoriesErrorState(e.toString()));
    });
  }

  FavoritesModel? favoritesModel;
  void ChangeToFavorites({required  productId}) {
    // تغير لحظي والحقيقي بيحصل في الباك جراوند
    favoriteMap[productId!] = !favoriteMap[productId]!;
    emit(ChangeToFavoritesState()); //emit 3shaan y7sl intime!
    dio_helper
        .postData(
            url: 'favorites', data: {'product_id': productId}, token: token)
        .then((value) {
      favoritesModel = FavoritesModel.fromjason(value!.data);
      if (favoritesModel!.status == false) {
        favoriteMap[productId] = !favoriteMap[productId]!;
        //ارجع زي م كنت في حاله
      } else {
        //success delete or add
        getFavoritesData();
      }
      emit(ChangeToFavoritesSuccessState(favoritesModel!));
      print("add is done");
    }).catchError((error) {
      print(error.toString());
      //ارجع زي م كنت في حاله
      favoriteMap[productId] = !favoriteMap[productId]!;

      emit(ChangeToFavoritesErrorState(error.toString()));
    });
  }

  GetFavoritesModel? getFavoritesModel;
  getFavoritesData() {
    emit(GetUserLoadingState());

    dio_helper
        .getData(
      url: 'favorites',
      token: token,
    )
        .then((value) {
  
      getFavoritesModel = GetFavoritesModel.fromJson(value!.data);
      print("getfavmode");
       print(value!.data);
      print("getfavmode");
     
     
       print("fav data get fuc ${token}");

      
      emit(GetFavoritesSuccessState(getFavoritesModel!));
    }).catchError((e) {
      print(e.toString());
      emit(GetFavoritesErrorState(e.toString()));
    });
  }

  loginModel? userModel;
 
  getUserData() {
    emit(GetUserLoadingState());

    dio_helper
        .getData(
      url: PROFILE,
      token: token,
    )
        .then((value) {
      print(value!.data);
        
      //UserModel = UserModel.fromJson(value!.data);
      userModel = loginModel.fromjason(value.data);
      print('userdata is token is'+token.toString());
      emit(GetUserSuccessState(userModel!.data!));
    }).catchError((e) {
      print(e.toString());
      emit(GetUserErrorState(e.toString()));
    });
  }

  loginModel? LoginModel;
  postRegiserData(image,
      {required name, required phone, required email, required password}) {
    emit(RegisterLoadingState());
    dio_helper.postData(url: REGISTER, data: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
    }).then((value) {
    print(token);
      LoginModel = loginModel.fromjason(value!.data);
        print(token);
      emit(RegisterSuccessState(LoginModel));
    }).catchError((e) {
      print(e.toString());
      emit(RegisterErrorState(e.toString()));
    });
  }
  
  //for register
  //VisiablityIconState
    bool isvisiable=false;
    IconData icon= Icons.visibility;
    void ChangeVisiablityIcon(){
       if(isvisiable) 
       {
        icon=Icons.visibility_off;
        isvisiable=!isvisiable; //false
       }
       else{
        icon= Icons.visibility;
        isvisiable=!isvisiable;
       }
       emit(RsgisterVisiablityIconState ());
    }

}
