// ignore_for_file: prefer_const_constructors
import 'package:email_launcher/email_launcher.dart';
import 'package:email_launcher/src/email_launcher.dart';
import 'package:flutter_test/flutter_test.dart';

Future<bool> can(Uri url) async {
  return true;
}

Future<bool> launc(Uri url) async {
  return true;
}

void main() {
  group('EmailLauncher', () {
    test('can be instantiated', () {
      expect(EmailLauncher(can, launc), isNotNull);
    });
  });
}
