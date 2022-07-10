// ignore_for_file: public_member_api_docs
import 'package:formz/formz.dart';

enum CompanyNameValidation { valid, invalid }

class CompanyName extends FormzInput<String, CompanyNameValidation> {
  const CompanyName.dirty([super.value = '']) : super.dirty();
  const CompanyName.pure() : super.pure('');

  @override
  CompanyNameValidation? validator(String value) {
    // ignore: lines_longer_than_80_chars
    return value.isEmpty ? CompanyNameValidation.invalid : CompanyNameValidation.valid;
  }
}
