import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../account.dart';

class CompanyNameTextField extends StatefulWidget {
  const CompanyNameTextField({super.key});

  @override
  State<CompanyNameTextField> createState() => _CompanyNameTextFieldState();
}

class _CompanyNameTextFieldState extends State<CompanyNameTextField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          _controller.text = state.companyName.value;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 18),
          child: TextFormField(
            key: const Key('accountView_companyName_textField'),
            controller: _controller,
            readOnly: state.status.isLoading,
            textInputAction: TextInputAction.next,
            onChanged: (companyName) => context.read<AccountBloc>().add(
                  AccountCompanyNameChangeEvent(companyName),
                ),
            decoration: const InputDecoration(labelText: 'Company Name'),
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
