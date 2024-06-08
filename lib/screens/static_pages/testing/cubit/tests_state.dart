part of 'tests_cubit.dart';

@immutable
sealed class TestsState {}

final class TestsInitial extends TestsState {}

class TestLoadingState extends TestsState {}

class TestErrorState extends TestsState {
  final String ErrMessage;

  TestErrorState(this.ErrMessage);
}

class TestSuccessState extends TestsState {}

class TestsItemSelected extends TestsState {
  final int selectedIndex;

    TestsItemSelected(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class PlusOrNO extends TestsState{}

class TestsLoading extends TestsState {}

class TestsLoaded extends TestsState {
  final List<AvailableTests> tests;

  TestsLoaded(this.tests);
}

class TestsError extends TestsState {
  final String error;

  TestsError(this.error);
}
