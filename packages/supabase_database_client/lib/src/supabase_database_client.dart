// ignore_for_file: public_member_api_docs

import 'package:supabase_database_client/src/exception/exception.dart';
import 'package:supabase_database_client/src/models/models.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDatabaseClient {
  const SupabaseDatabaseClient(SupabaseClient client) : _client = client;

  final SupabaseClient _client;

  Future<SupabaseUser> getUserProfile() async {
    try {
      final response = await _client
          .from('account')
          .select()
          .eq('id', _client.auth.currentUser?.id)
          .single()
          .execute();
      final data = response.data as Map<String, dynamic>;
      return SupabaseUser.fromJson(data);
    } catch (e, s) {
      Error.throwWithStackTrace(SupabeseUserInfoFailure, s);
    }
  }

  Future<void> updateUser(SupabaseUser user) async {
    try {
      final supabaseUser = SupabaseUser(
        id: _client.auth.currentUser?.id,
        userName: user.userName,
        companyName: user.companyName,
      );

      await _client.from('account').upsert(supabaseUser.toJson()).execute();
    } catch (e, s) {
      Error.throwWithStackTrace(SupabeseUserUpdateFailure(e), s);
    }
  }
}
