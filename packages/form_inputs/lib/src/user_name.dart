// ignore_for_file: public_member_api_docs
import 'package:formz/formz.dart';

enum UserNameValidation { valid, invalid }

class UserName extends FormzInput<String, UserNameValidation> {
  const UserName.dirty([super.value = '']) : super.dirty();
  const UserName.pure() : super.pure('');

  @override
  UserNameValidation? validator(String value) {
    // ignore: lines_longer_than_80_chars
    return value.isEmpty ? UserNameValidation.invalid : UserNameValidation.valid;
  }
}
