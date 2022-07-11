import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../account.dart';
import 'account_view.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: AccountPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(context.read<UserRepository>())
        ..add(
          AccountInfoFetchEvent(),
        ),
      child: const AccountView(),
    );
  }
}
