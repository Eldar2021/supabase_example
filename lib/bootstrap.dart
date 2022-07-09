// https://github1s.com/VGVentures/supabase_example/blob/HEAD/pubspec.yaml
// https://verygood.ventures/blog/flutter-app-very-good-cli-supabase

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_auth_client/supabase_auth_client.dart';
import 'package:supabase_database_client/supabase_database_client.dart';
import 'package:supabase_example/app/view/meta_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:user_repository/user_repository.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/env.env');

  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('ANON_KEY'),
  );

  final authClient = SupabaseAuthClient(Supabase.instance.client.auth);
  final databaseClient = SupabaseDatabaseClient(Supabase.instance.client);
  final userRepository = UserRepository(authClient, databaseClient);

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(App(userRepository)),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
