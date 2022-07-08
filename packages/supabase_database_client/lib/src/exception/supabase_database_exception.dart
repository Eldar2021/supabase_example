// ignore_for_file: public_member_api_docs

abstract class SupabaseDataBaseException implements Exception {
  const SupabaseDataBaseException(this.error);

  final Object error;
}

class SupabeseUserInfoFailure extends SupabaseDataBaseException {
  SupabeseUserInfoFailure(super.error);
}

class SupabeseUserUpdateFailure extends SupabaseDataBaseException {
  SupabeseUserUpdateFailure(super.error);
}
