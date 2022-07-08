// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_auth_client/supabase_auth_client.dart';
import 'package:supabase_database_client/supabase_database_client.dart';
import 'package:user_repository/user_repository.dart';

class MockSupabaseAuthClient extends Mock implements SupabaseAuthClient {}

// ignore: lines_longer_than_80_chars
class MockSupabaseDatabaseClient extends Mock implements SupabaseDatabaseClient {}

void main() {
  group('UserRepository', () {
    test('can be instantiated', () {
      expect(
        UserRepository(MockSupabaseAuthClient(), MockSupabaseDatabaseClient()),
        isNotNull,
      );
    });
  });
}
