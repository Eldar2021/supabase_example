import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../src.dart';

class App extends StatelessWidget {
  const App(this.userRepository, {super.key});
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: userRepository,
      child: BlocProvider(
        create: (context) => AppBloc(),
        child: const AppView(),
      ),
    );
  }
}
