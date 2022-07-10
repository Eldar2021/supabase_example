import 'package:email_launcher/email_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';

import '../login.dart';

@visibleForTesting
class OpenEmailButton extends StatelessWidget {
  const OpenEmailButton(this._emailLauncher, {super.key});

  final EmailLauncher _emailLauncher;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;
    return OutlinedButton(
      // ignore: lines_longer_than_80_chars
      onPressed: state.status.isInProgress || !state.valid ? null : _emailLauncher.launchEmailApp,
      child: const Text('open email button'),
    );
  }
}
