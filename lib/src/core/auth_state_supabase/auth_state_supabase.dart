import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthStateSupabase<T extends StatefulWidget> extends SupabaseAuthState {
  @override
  void onAuthenticated(Session session) {
    //if(mounted)
  }

  @override
  void onErrorAuthenticating(String message) {}

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onUnauthenticated() {}
}
