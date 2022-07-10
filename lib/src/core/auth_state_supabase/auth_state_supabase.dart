import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../src.dart';

class AuthStateSupabase<T extends StatefulWidget> extends SupabaseAuthState {
  @override
  void onAuthenticated(Session session) {
    if (mounted) context.read<AppBloc>().add(AppAuthenticatedEvent());
  }

  @override
  void onErrorAuthenticating(String message) {}

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onUnauthenticated() {
    if (mounted) context.read<AppBloc>().add(AppUnAuthenticatedEvent());
  }
}
