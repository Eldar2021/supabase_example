// ignore_for_file: public_member_api_docs

import 'package:supabase_auth_client/src/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthClient {
  const SupabaseAuthClient(GoTrueClient auth) : _auth = auth;

  final GoTrueClient _auth;

  Future<void> signIn({required String email, required bool isWeb}) async {
    try {
      await _auth.signIn(
        email: email,
        options: AuthOptions(
          redirectTo: isWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
        ),
      );
    } catch (e, s) {
      Error.throwWithStackTrace(SupaBaseSignInFailure(e), s);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e, s) {
      Error.throwWithStackTrace(SupaBaseSignOutFailure(e), s);
    }
  }
}
