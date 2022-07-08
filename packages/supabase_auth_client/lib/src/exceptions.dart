// ignore_for_file: public_member_api_docs

abstract class SupabaseAuthException implements Exception {
  const SupabaseAuthException(this.error);

  final Object error;
}

class SupaBaseSignInFailure extends SupabaseAuthException {
  const SupaBaseSignInFailure(super.error);
}

class SupaBaseSignOutFailure extends SupabaseAuthException {
  const SupaBaseSignOutFailure(super.error);
}
