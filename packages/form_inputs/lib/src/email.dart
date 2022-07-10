// ignore_for_file: public_member_api_docs
import 'package:formz/formz.dart';

enum EmailValidation { valid, invalid }

class Email extends FormzInput<String, EmailValidation> {
  const Email.dirty([super.value = '']) : super.dirty();
  const Email.pure() : super.pure('');

  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  @override
  EmailValidation? validator(String value) {
    // ignore: lines_longer_than_80_chars
    return _emailRegExp.hasMatch(value) ? EmailValidation.valid : EmailValidation.invalid;
  }
}
