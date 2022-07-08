// ignore_for_file: public_member_api_docs

import 'package:supabase_auth_client/supabase_auth_client.dart';
import 'package:supabase_database_client/supabase_database_client.dart';

class UserRepository {
  const UserRepository(
    SupabaseAuthClient authClient,
    SupabaseDatabaseClient databaseClient,
  )   : _authClient = authClient,
        _databaseClient = databaseClient;

  final SupabaseAuthClient _authClient;
  final SupabaseDatabaseClient _databaseClient;

  Future<SupabaseUser> getUser() async {
    final supabaseUser = await _databaseClient.getUserProfile();
    return supabaseUser;
  }

  Future<void> updateUser(SupabaseUser user) async {
    await _databaseClient.updateUser(user);
  }

  Future<void> singIn({required String email, required bool isWeb}) async {
    return _authClient.signIn(email: email, isWeb: isWeb);
  }

  Future<void> signOut() async => _authClient.signOut();
}
