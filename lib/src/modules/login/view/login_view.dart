import 'package:email_launcher/email_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 32,
        ),
        children: const [
          LoginHeader(),
          SizedBox(height: 18),
          EmailInput(),
          SizedBox(height: 28),
          SendEmailButton(),
          SizedBox(height: 28),
          if (!kIsWeb) OpenEmailButton(EmailLauncher()),
        ],
      ),
    );
  }
}
