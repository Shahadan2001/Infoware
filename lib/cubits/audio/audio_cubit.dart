import 'package:flutter_bloc/flutter_bloc.dart';

class AudioCubit extends Cubit<bool> {
  AudioCubit() : super(false);
  void onButtonClicked() {
    emit(!state);
  }
}
