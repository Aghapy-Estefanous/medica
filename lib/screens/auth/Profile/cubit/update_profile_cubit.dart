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
    // required String nid,
    required String email,
    // required String username,
    required String phoneNumber,
    // required String gender,
  }) async {
    emit(UpdateProfileLoadingState());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('Token');
      var id = sharedPreferences.getString('id');
      final response = await dio_helper.putData(
        url: BaseUrl + 'ApplicationUser/Edit-Basic-Data',
        AccessToken: token,
        query: {
          'ID': '11223344556677',
          'FirstName': firstName,
          'LastName': lastName,
          'PhoneNumber': phoneNumber,
          'Email': email,
          // 'UserName': 'aa',
          // 'age': age,
        },
        data: {
          'ID': '11223344556677',
          'FirstName': firstName,
          'LastName': lastName,
          // 'UserName': 'aa',
          'Email': email,
          'PhoneNumber': phoneNumber,
        },
      );
      print("fyif7n " + response!.statusCode.toString());
      print("################### " + response.statusMessage.toString());

      if (response?.statusCode == 200) {
        emit(UpdateProfileSuccessState());
      } else {
        emit(UpdateProfileErrorState('Failed to update profile'));
      }
    } catch (e) {
      print(e.toString());
      emit(UpdateProfileErrorState(e.toString()));
    }
  }
}
