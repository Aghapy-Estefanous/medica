part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileData extends ProfileState {
  ProfileModel userProfile;
  ProfileData(this.userProfile);
}

class ButtonState extends ProfileState {}


class ProfileLoggedOut extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
