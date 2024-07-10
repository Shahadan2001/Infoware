import 'package:bloc/bloc.dart';
import 'package:infoware_task/form_fields/email_validator.dart';
import 'package:infoware_task/form_fields/name_validator.dart';
import 'package:infoware_task/form_fields/phone_validator.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void onNameChanged(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(name: const Name.pure()));
    } else {
      emit(state.copyWith(name: Name.dirty(value)));
    }
  }

  void onGenderChanged(value) {
    emit(state.copyWith(gender: value));
  }

  void onCountryChanged(value) {
    emit(state.copyWith(country: value));
  }

  void onCityChanged(value) {
    emit(state.copyWith(city: value));
  }

  void onStateChanged(value) {
    emit(state.copyWith(state: value));
  }

  void onEmailChanged(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(email: const Email.pure()));
    } else {
      emit(state.copyWith(email: Email.dirty(value)));
    }
  }

  void onPhoneChanged(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(phone: const Phone.pure()));
    } else {
      emit(state.copyWith(phone: Phone.dirty(value)));
    }
  }
}
