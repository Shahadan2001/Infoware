import 'package:formz/formz.dart';

class Email extends FormzInput<String, bool> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);
  @override
  bool? validator(value) {
    RegExp regExp = RegExp(r"^[a-z0-9]+@[a-z]+[.][a-z]+$");
    bool hasMatch = regExp.hasMatch(value);
    return hasMatch ? null : hasMatch;
  }
}
