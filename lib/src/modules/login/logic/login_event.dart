part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmittedEvent extends LoginEvent {
  const LoginSubmittedEvent({required this.email, required this.isWeb});

  final String email;
  final bool isWeb;

  @override
  List<Object> get props => [email, isWeb];
}

class LoginEmailChangedEvent extends LoginEvent {
  const LoginEmailChangedEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}
