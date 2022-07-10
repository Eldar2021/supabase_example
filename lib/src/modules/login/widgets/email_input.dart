import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';

import '../login.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginBloc bloc) => bloc.state.status == FormzSubmissionStatus.inProgress,
    );
    return TextFormField(
      key: const Key('loginView_emailInput_textField'),
      readOnly: isInProgress,
      onChanged: (email) {
        context.read<LoginBloc>().add(LoginEmailChangedEvent(email));
      },
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }
}
