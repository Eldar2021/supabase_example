import 'package:flutter/material.dart';
import 'package:supabase_example/src/generated/generated.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('loginView_header'),
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
              width: 200,
              height: 100,
              child: Assets.images.vgv.image(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Sign in via the magic link',
                style: Theme.of(context).textTheme.headline5,
              ),
            )
          ],
        )
      ],
    );
  }
}
