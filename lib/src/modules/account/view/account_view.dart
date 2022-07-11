import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src.dart';
import '../widgets/widgets.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: BlocConsumer<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state.status.isUpdate) context.showNackBar(message: 'Updated!');
        },
        buildWhen: (previous, current) =>
            // ignore: lines_longer_than_80_chars
            current.status.isSuccess || current.status.isUpdate || current.status.isEditing,
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(28),
            children: const [
              AccountHeader(),
              UserNameTextField(),
              CompanyNameTextField(),
              SizedBox(height: 50),
              UpdateUserButton(),
              SizedBox(height: 18),
              SignOutButton(),
            ],
          );
        },
      ),
    );
  }
}
