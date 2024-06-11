import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/network/remote/endpoint.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  void updateProfile({
    required String firstName,
    required String lastName,
    required String nid,
    required String email,
    required String age,
    required String phoneNumber,
    required String gender,
  }) async {
    emit(UpdateProfileLoadingState());
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('Token');
    // print('gggggggggggg $gender');
    dio_helper
        .putData(url: BaseUrl + 'ApplicationUser', AccessToken: token, data: {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phoneNumber,
      'nid': nid,
      'Gender': gender,

      // 'age': age,
    }).then((value) {
      print(value?.statusMessage);
      print(value?.data);
      if (value?.statusCode == 200) {
        emit(UpdateProfileSuccessState());
      }
    }).catchError((e) {
      emit(UpdateProfileErrorState(e.toString()));
    });
  }
}
