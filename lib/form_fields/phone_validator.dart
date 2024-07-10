import 'package:formz/formz.dart';

class Phone extends FormzInput<String, bool> {
  const Phone.pure() : super.pure('');
  const Phone.dirty([String value = '']) : super.dirty(value);
  @override
  bool? validator(value) {
    RegExp regExp = RegExp(r'^[6789]\d{9}$');
    bool hasMatch = regExp.hasMatch(value);
    return hasMatch ? null : hasMatch;
  }
}
