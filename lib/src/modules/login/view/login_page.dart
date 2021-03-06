import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../../src.dart';
import 'login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context.read<UserRepository>()),
      child: const LoginView(),
    );
  }
}
