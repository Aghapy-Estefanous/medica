import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/models/testModel.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'package:medica/shared/network/remote/endpoint.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit() : super(TestsInitial());
  static TestsCubit get(context) => BlocProvider.of(context);

  void available() async {
    print('###################################');
    emit(TestsLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('Token');
      var response = await dio_helper.getData(
        url: BaseUrl + 'TestLab/GetListTest',
        AccessToken: token,
      );

      var data = response?.data['data'] as List;
      List<AvailableTests> tests =
          data.map((item) => AvailableTests.fromjson(item)).toList();
      print('#################');
      emit(TestsLoaded(tests));
    } catch (error) {
      emit(TestsError(error.toString()));
    }
  }

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
