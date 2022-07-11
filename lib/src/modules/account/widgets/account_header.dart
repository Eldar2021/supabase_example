import 'package:flutter/material.dart';

import '../../../src.dart';

class AccountHeader extends StatelessWidget {
  const AccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('account_header'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox.square(
              dimension: 100,
              child: Assets.images.supabase.image(),
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: Assets.images.vgv.image(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Update your information 🦄',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
