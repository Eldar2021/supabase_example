import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../account.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (AccountBloc bloc) => bloc.state.status == AccountStatus.loading,
    );
    return OutlinedButton(
      onPressed: isLoading
          ? null
          : () => context.read<AccountBloc>().add(
                AccountSignOutEvent(),
              ),
      child: const Text('Sign Out'),
    );
  }
}
