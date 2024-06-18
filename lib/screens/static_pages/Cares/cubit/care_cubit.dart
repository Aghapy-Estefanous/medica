import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'care_state.dart';

class CareCubit extends Cubit<CareState> {
  CareCubit() : super(CareInitial());
  static CareCubit get(context) => BlocProvider.of(context);



  int select = 0;
  void selected(int index) {
    select = index;
    emit(CaresItemSelected(index));
  }
}
