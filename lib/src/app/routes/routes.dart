import 'package:flutter/material.dart';
import 'package:supabase_example/src/app/app.dart';

typedef _LPD = List<Page<dynamic>>;

// ignore: library_private_types_in_public_api
_LPD onGenerateAppViewPages(AppStatus status, _LPD pages) {
  switch (status) {
    case AppStatus.authenticated:
      return [];
    case AppStatus.unauthenticated:
      return [];
  }
}
