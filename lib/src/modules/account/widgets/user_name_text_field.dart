import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../account.dart';

class UserNameTextField extends StatefulWidget {
  const UserNameTextField({super.key});

  @override
  State<UserNameTextField> createState() => _UserNameTextFieldState();
}

class _UserNameTextFieldState extends State<UserNameTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          _controller.text = state.userName.value;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 18),
          child: TextFormField(
            key: const Key('accountView_userName_textField'),
            controller: _controller,
            readOnly: state.status.isLoading,
            textInputAction: TextInputAction.next,
            onChanged: (userName) => context.read<AccountBloc>().add(
                  AccountUserNameChangeEvent(userName),
                ),
            decoration: const InputDecoration(labelText: 'User Name'),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
