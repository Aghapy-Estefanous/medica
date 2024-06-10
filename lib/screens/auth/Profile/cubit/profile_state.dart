part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoggedOut extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
