// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_database_client/supabase_database_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabeseClient extends Mock implements SupabaseClient {}

void main() {
  group('SupabaseDatabaseClient', () {
    test('can be instantiated', () {
      expect(SupabaseDatabaseClient(MockSupabeseClient()), isNotNull);
    });
  });
}
