import 'package:formz/formz.dart';

class Name extends FormzInput<String, bool> {
  const Name.pure() : super.pure('');
  const Name.dirty([String value = '']) : super.dirty(value);
  @override
  bool? validator(value) {
    RegExp regExp = RegExp(r"^[A-Za-z' -]+$");
    bool hasMatch = regExp.hasMatch(value);
    return hasMatch ? null : hasMatch;
  }
}
