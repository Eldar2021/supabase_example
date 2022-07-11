part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountInfoFetchEvent extends AccountEvent {}

class AccountUserUpdateEvent extends AccountEvent {
  const AccountUserUpdateEvent(this.user);

  final SupabaseUser user;
  @override
  List<Object> get props => [user];
}

class AccountUserNameChangeEvent extends AccountEvent {
  const AccountUserNameChangeEvent(this.userName);

  final String userName;
  @override
  List<Object> get props => [userName];
}

class AccountCompanyNameChangeEvent extends AccountEvent {
  const AccountCompanyNameChangeEvent(this.companyName);

  final String companyName;

  @override
  List<Object> get props => [companyName];
}

class AccountSignOutEvent extends AccountEvent {}
