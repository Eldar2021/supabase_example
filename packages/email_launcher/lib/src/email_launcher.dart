// ignore_for_file: public_member_api_docs

import 'dart:developer';

import 'package:android_intent_plus/android_intent.dart';
import 'package:email_launcher/email_launcher.dart';
// import 'package:flutter/foundation.dart';
// import 'package:platform/platform.dart';
import 'package:url_launcher/url_launcher.dart';

typedef FBFU = Future<bool> Function(Uri uri);

class EmailLauncher {
  const EmailLauncher({FBFU? launchUrlProvider, FBFU? canLaunchUrlProvider})
      : _launchUrlProvider = launchUrlProvider ?? launchUrl,
        _canLaunchUrlProvider = canLaunchUrlProvider ?? canLaunchUrl;

  final FBFU _launchUrlProvider;

  final FBFU _canLaunchUrlProvider;

  Future<void> launchEmailApp() async {
    try {
      log('------------ Init -------- AndroidIntent');
      // ignore: unrelated_type_equality_checks
      // if (defaultTargetPlatform == Platform.android) {
        log('------------ Platform.android -------- AndroidIntent');
        const intent = AndroidIntent(
          action: 'android.intent.action.MAIN',
          category: 'android.intent.category.APP_EMAIL',
        );
        await intent.launch();
        log('------------ Success -------- AndroidIntent');
        // ignore: unrelated_type_equality_checks
      // } else if (defaultTargetPlatform == Platform.iOS) {
      //   final url = Uri(scheme: 'message');
      //   if (await _canLaunchUrlProvider(url)) {
      //     await _launchUrlProvider(url);
      //   }
      // }
    } catch (e, s) {
      log('------------ Error -------- AndroidIntent $e');
      Error.throwWithStackTrace(LaunchEmailAppFailure(e), s);
    }
  }
}
