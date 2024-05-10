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

