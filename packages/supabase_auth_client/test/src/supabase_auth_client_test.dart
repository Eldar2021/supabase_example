// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_auth_client/supabase_auth_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockGoTrueClient extends Mock implements GoTrueClient {}

void main() {
  group('SupabaseAuthClient', () {
    test('can be instantiated', () {
      expect(SupabaseAuthClient(GoTrueClient()), isNotNull);
    });
  });
}
