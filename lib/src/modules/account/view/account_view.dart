import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      // body: BlocConsumer(
      //   listener: (context, state) {},
      //   builder: (context, state) {},
      // ),
    );
  }
}
