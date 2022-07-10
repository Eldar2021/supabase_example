// ignore_for_file: public_member_api_docs

import 'package:android_intent_plus/android_intent.dart';
import 'package:email_launcher/exceptions/exception.dart';
import 'package:flutter/foundation.dart';
import 'package:platform/platform.dart';
import 'package:url_launcher/url_launcher.dart';

typedef FBFU = Future<bool> Function(Uri uri);

class EmailLauncher {
  const EmailLauncher(FBFU? launchUrlProvider, FBFU? canLaunchUrlProvider)
      : _launchUrlProvider = launchUrlProvider ?? launchUrl,
        _canLaunchUrlProvider = canLaunchUrlProvider ?? canLaunchUrl;

  final FBFU _launchUrlProvider;

  final FBFU _canLaunchUrlProvider;

  Future<void> launchEmailApp() async {
    try {
      // ignore: unrelated_type_equality_checks
      if (defaultTargetPlatform == Platform.android) {
        const intent = AndroidIntent(
          action: 'android.intent.action.MAIN',
          category: 'android.intent.category.APP_EMAIL',
        );
        await intent.launch();
        // ignore: unrelated_type_equality_checks
      } else if (defaultTargetPlatform == Platform.iOS) {
        final url = Uri(scheme: 'message');
        if (await _canLaunchUrlProvider(url)) {
          await _launchUrlProvider(url);
        }
      }
    } catch (e, s) {
      Error.throwWithStackTrace(LaunchEmailAppFailure(e), s);
    }
  }
}
