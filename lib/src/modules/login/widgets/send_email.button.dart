import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';

import '../login.dart';

class SendEmailButton extends StatelessWidget {
  const SendEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;
    return ElevatedButton(
      key: const Key('loginView_sendEmail_button'),
      onPressed: state.status.isInProgress || !state.valid
          ? null
          : () => context.read<LoginBloc>().add(
                LoginSubmittedEvent(email: state.email.value, isWeb: kIsWeb),
              ),
      child: Text(state.status.isInProgress ? 'Loading' : 'Send Magic link'),
    );
  }
}
