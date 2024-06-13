import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medica/models/testModel.dart';
import 'package:medica/models/testResultModel.dart';
import 'package:medica/shared/network/remote/Dio_helper.dart';
import 'package:medica/shared/network/remote/endpoint.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tests_state.dart';

class TestsCubit extends Cubit<TestsState> {
  TestsCubit() : super(TestsInitial());

  static TestsCubit get(context) => BlocProvider.of(context);

  void available() async {
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
      emit(TestsLoaded(tests));
    } catch (error) {
      emit(TestsError(error.toString()));
    }
  }

  void testResult() async {
    print("testResult() called"); // Debug print statement
    emit(TestResultLoading());
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('Token');

      var response = await dio_helper.getData(
          url: BaseUrl + 'TestResult/All-Test-Results', AccessToken: token
          // AccessToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ2hhcHkiLCJqdGkiOiJmYzE1OTVlNC0yYjIxLTQzNjctYTU3MS1kZDYyYjI5N2UzYTkiLCJlbWFpbCI6ImFnaGFweTA4MEBnbWFpbC5jb20iLCJ1aWQiOiIxMTIyMzM0NDU1NjY3NyIsInJvbGVzIjoiVXNlciIsImV4cCI6MTcyMDUzMzQ1NX0.F02wKFgGnYsTNSjyYrHzHwSm9e5R0kUpOIwPRnPWUP0', // Use token here
          );
      print(response?.statusMessage); // Debug print statement
      if (response != null && response.data != null) {
        var data = response.data['data'] as List;
        List<DataModel> testResults =
            data.map((item) => DataModel.fromJson(item)).toList();
        emit(TestResultLoaded(testResults));
      } else {
        emit(TestResultError("No data found"));
      }
    } catch (error) {
      print("Error: $error"); // Debug print statement
      emit(TestResultError(error.toString()));
    }
  }

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

  int Fselect = 0;
  void fselected(int index) {
    select = index;
    emit(FItemSelected(index));
  }

  int fselectedDescriptionIndex = -1;

  void fselectDescription(int index) {
    if (fselectedDescriptionIndex == index) {
      fselectedDescriptionIndex = -1; // Deselect if already selected
    } else {
      fselectedDescriptionIndex = index; // Select the description
    }
    emit(FPlusOrNO()); // Emit state to rebuild UI
  }
}


// class TestsCubit extends Cubit<TestsState> {
//   TestsCubit() : super(TestsInitial());
//   static TestsCubit get(context) => BlocProvider.of(context);

//   void available() async {
//     emit(TestsLoading());
//     try {
//       SharedPreferences sharedPreferences =
//           await SharedPreferences.getInstance();
//       var token = sharedPreferences.getString('Token');
//       var response = await dio_helper.getData(
//         url: BaseUrl + 'TestLab/GetListTest',
//         AccessToken: token,
//       );

//       var data = response?.data['data'] as List;
//       List<AvailableTests> tests =
//           data.map((item) => AvailableTests.fromjson(item)).toList();

//       emit(TestsLoaded(tests));
//     } catch (error) {
//       emit(TestsError(error.toString()));
//     }
//   }

//   void testResult() async {
//     emit(TestResultLoading());
//     try {
//       SharedPreferences sharedPreferences =
//           await SharedPreferences.getInstance();
//       var token = sharedPreferences.getString('Token');

//       var response = await dio_helper.getData(
//         url: BaseUrl + 'TestResult/All-Test-Results',
//         AccessToken: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZ2hhcHkiLCJqdGkiOiJmYzE1OTVlNC0yYjIxLTQzNjctYTU3MS1kZDYyYjI5N2UzYTkiLCJlbWFpbCI6ImFnaGFweTA4MEBnbWFpbC5jb20iLCJ1aWQiOiIxMTIyMzM0NDU1NjY3NyIsInJvbGVzIjoiVXNlciIsImV4cCI6MTcyMDUzMzQ1NX0.F02wKFgGnYsTNSjyYrHzHwSm9e5R0kUpOIwPRnPWUP0',
//       );

//       if (response != null && response.data != null) {
//         var data = response.data['data'] as List;
//         List<DataModel> testResults =
//             data.map((item) => DataModel.fromJson(item)).toList();

//         emit(TestResultLoaded(testResults));
//       } else {
//         emit(TestResultError("No data found"));
//       }
//     } catch (error) {
//       emit(TestResultError(error.toString()));
//     }
//   }

//   int select = 0;
//   void selected(int index) {
//     select = index;
//     emit(TestsItemSelected(index));
//   }

//   int selectedDescriptionIndex = -1;

//   void selectDescription(int index) {
//     if (selectedDescriptionIndex == index) {
//       selectedDescriptionIndex = -1; // Deselect if already selected
//     } else {
//       selectedDescriptionIndex = index; // Select the description
//     }
//     emit(PlusOrNO()); // Emit state to rebuild UI
//   }
// }
