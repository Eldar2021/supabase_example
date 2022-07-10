part of 'account_bloc.dart';

enum AccountStatus { initial, update, success, error, loading, edit }

extension AccountStatusX on AccountStatus {
  bool get isInitial => this == AccountStatus.initial;
  bool get isSuccess => this == AccountStatus.success;
  bool get isUpdate => this == AccountStatus.update;
  bool get isError => this == AccountStatus.error;
  bool get isLoading => this == AccountStatus.loading;
  bool get isEditing => this == AccountStatus.edit;
}

class AccountState extends Equatable {
  const AccountState({
    SupabaseUser? supabaseUser,
    this.valid = false,
    this.userName = const UserName.pure(),
    this.companyName = const CompanyName.pure(),
    this.status = AccountStatus.initial,
  }) : user = supabaseUser ?? SupabaseUser.empty;

  final UserName userName;
  final CompanyName companyName;
  final SupabaseUser user;
  final bool valid;
  final AccountStatus status;

  @override
  List<Object> get props => [userName, companyName, user, valid, status];

  AccountState copyWith({
    UserName? userName,
    CompanyName? companyName,
    SupabaseUser? user,
    bool? valid,
    AccountStatus? status,
  }) {
    return AccountState(
      companyName: companyName ?? this.companyName,
      userName: userName ?? this.userName,
      status: status ?? this.status,
      supabaseUser: user ?? this.user,
      valid: valid ?? this.valid,
    );
  }
}

class AccountInitial extends AccountState {}
