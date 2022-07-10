// ignore_for_file: public_member_api_docs

abstract class EmailLunchException implements Exception {
  const EmailLunchException(this.error);

  final Object error;
}

class LaunchEmailAppFailure extends EmailLunchException {
  LaunchEmailAppFailure(super.error);
}
