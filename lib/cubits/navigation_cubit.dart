import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);
  void onChanged(int value) {
    if (value == 0) {
      emit(0);
    } else {
      emit(1);
    }
  }
}
