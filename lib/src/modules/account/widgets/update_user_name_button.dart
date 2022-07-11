import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_database_client/supabase_database_client.dart';

import '../account.dart';

class UpdateUserButton extends StatelessWidget {
  const UpdateUserButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AccountBloc>().state;
    return ElevatedButton(
      onPressed: state.status.isLoading || !state.valid
          ? null
          : () => context.read<AccountBloc>().add(
                AccountUserUpdateEvent(
                  SupabaseUser(
                    id: state.user.id,
                    userName: state.userName.value,
                    companyName: state.companyName.value,
                  ),
                ),
              ),
      child: Text(state.status.isLoading ? 'Saving...' : 'Update'),
    );
  }
}
