import 'package:shop_app/models/homeModel.dart';
import 'package:shop_app/models/loginModel.dart';
import 'package:shop_app/models/favoritesModel.dart';
import 'package:shop_app/models/categoriesModel.dart';
import 'package:shop_app/shared/cubit/ShopCubit.dart';
import 'package:shop_app/models/getFavoritesModel.dart';

abstract class shopState {}

class shopInitialState extends shopState {}

class ChangeBottomNavigateBarState extends shopState {}
//class shopInitialState extends shopState {}

class shopHomeLoadingState extends shopState {}

class shopHomeSuccessgState extends shopState {
  MyHomeModel? model;
  shopHomeSuccessgState(this.model);
}

class shopHomeErrorState extends shopState {
  final String error;
  shopHomeErrorState(this.error);
}

class shopCategoriesLoadingState extends shopState {}

class shopCategoriesSuccessgState extends shopState {
  CategoriesModel? model;
  shopCategoriesSuccessgState(this.model);
}

class shopCategoriesErrorState extends shopState {
  final String error;
  shopCategoriesErrorState(this.error);
}

class shopFavoritesLoadingState extends shopState {}

class shopFavoritesSuccessgState extends shopState {
  //    FavoritesModel? model;
  //  shopFavoritesSuccessgState(this.model);
  //
}

class shopFavoritesErrorState extends shopState {
  final String error;
  shopFavoritesErrorState(this.error);
}

//............................add to favorites
class ChangeToFavoritesState extends shopState {}

class ChangeToFavoritesSuccessState extends shopState {
  FavoritesModel model;
  ChangeToFavoritesSuccessState(this.model);
}

class ChangeToFavoritesErrorState extends shopState {
  final String error;
  ChangeToFavoritesErrorState(this.error);
}

//............................get favorites
class GetFavoritesLoadingState extends shopState {}

class GetFavoritesSuccessState extends shopState {
  GetFavoritesModel model;
  GetFavoritesSuccessState(this.model);
}

class GetFavoritesErrorState extends shopState {
  final String error;
  GetFavoritesErrorState(this.error);
}
//user data states
class GetUserLoadingState extends shopState {}

class GetUserSuccessState extends shopState {
  UserModel model;
  GetUserSuccessState(this.model);
}

class GetUserErrorState extends shopState {
  final String error;
  GetUserErrorState(this.error);
}
//user data states
class RegisterLoadingState extends shopState {}

class RegisterSuccessState extends shopState {
   loginModel? model;
   RegisterSuccessState(this.model);

  
}

class RegisterErrorState extends shopState {
  final String error;
  RegisterErrorState(this.error);
}
   class RsgisterVisiablityIconState extends shopState{}


