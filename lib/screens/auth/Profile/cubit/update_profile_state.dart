part of 'update_profile_cubit.dart';

@immutable
sealed class UpdateProfileState {}

final class UpdateProfileInitial extends UpdateProfileState {}
final class UpdateProfileLoadingState extends UpdateProfileState {}
final class UpdateProfileSuccessState extends UpdateProfileState {}
final class UpdateProfileErrorState extends UpdateProfileState {
  final String error;
  
  UpdateProfileErrorState(this.error);
}
