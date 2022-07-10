import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../src.dart';

// ignore: avoid_private_typedef_functions
typedef _SARS = SupabaseAuthRequiredState;

class AppRequiredState<T extends StatefulWidget> extends _SARS {
  @override
  void onUnauthenticated() {
    if (mounted) context.read<AppBloc>().add(AppUnAuthenticatedEvent());
  }
}
