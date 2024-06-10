import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/ProfileModel.dart';
import '../../../../shared/network/remote/Dio_helper.dart';
import '../../../../shared/network/remote/endpoint.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> userData() async {
    print('user data called');
    emit(ProfileLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('Token');
      var response = await dio_helper.getData(
          url: BaseUrl + 'ApplicationUser/BasicData', AccessToken: token
          // AccessToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ2hhcHkiLCJqdGkiOiJmYzE1OTVlNC0yYjIxLTQzNjctYTU3MS1kZDYyYjI5N2UzYTkiLCJlbWFpbCI6ImFnaGFweTA4MEBnbWFpbC5jb20iLCJ1aWQiOiIxMTIyMzM0NDU1NjY3NyIsInJvbGVzIjoiVXNlciIsImV4cCI6MTcyMDUzMzQ1NX0.F02wKFgGnYsTNSjyYrHzHwSm9e5R0kUpOIwPRnPWUP0', // Use token here
          );

      if (response != null && response.data != null) {
        emit(ProfileData(ProfileModel.fromJson(response.data['data'])));
      } else {
        emit(ProfileError('No data found'));
      }
    } catch (e) {
      emit(ProfileError('Failed to login, $e'));
    }
  }

  Future<void> logout() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.remove('token');
      emit(ProfileLoggedOut());
    } catch (e) {
      emit(ProfileError('Failed to log out'));
    }
  }

  bool clicked = false;
  String buttontxt = 'Edit';

  void Change() {
    clicked = !clicked;
    buttontxt = clicked ? 'Submit' : 'Edit';
    emit(ButtonState());
  }
}
