part of 'care_cubit.dart';

@immutable
sealed class CareState {}

final class CareInitial extends CareState {}

class CareErrorState extends CareState {
  final String ErrMessage;

  CareErrorState(this.ErrMessage);
}

class CareSuccessState extends CareState {}

class CaresItemSelected extends CareState {
  final int selectedIndex;

  CaresItemSelected(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
