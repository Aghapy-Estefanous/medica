import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'package:meta/meta.dart';

part 'tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit() : super(TestsInitial());
  static TestsCubit get(context) => BlocProvider.of(context);

  void results() {}
  int select = 0;
  void selected(int index) {
    select = index;
    emit(TestsItemSelected(index));
  }

  int selectedDescriptionIndex = -1;

  void selectDescription(int index) {
    if (selectedDescriptionIndex == index) {
      selectedDescriptionIndex = -1; // Deselect if already selected
    } else {
      selectedDescriptionIndex = index; // Select the description
    }
    emit(PlusOrNO()); // Emit state to rebuild UI
  }
}
