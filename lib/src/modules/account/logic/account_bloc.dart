import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:supabase_database_client/supabase_database_client.dart';
import 'package:user_repository/user_repository.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc(this._repository) : super(AccountInitial()) {
    on<AccountInfoFetchEvent>(_onGetUserInformation);
    on<AccountUserUpdateEvent>(_onUpdateUser);
    on<AccountSignOutEvent>(_onSignOut);
    on<AccountUserNameChangeEvent>(_onUserNameChanged);
    on<AccountCompanyNameChangeEvent>(_onCompanyNameChanged);
  }

  final UserRepository _repository;

  Future<void> _onGetUserInformation(
    AccountInfoFetchEvent event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AccountStatus.loading));
      final user = await _repository.getUser();
      emit(
        state.copyWith(
          status: AccountStatus.success,
          user: user,
          userName: UserName.dirty(user.userName),
          companyName: CompanyName.dirty(user.companyName),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.error));
      addError(e);
    }
  }

  Future<void> _onUpdateUser(
    AccountUserUpdateEvent event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AccountStatus.loading));
      await _repository.updateUser(event.user);
      emit(state.copyWith(status: AccountStatus.update, valid: false));
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.error));
      addError(e);
    }
  }

  Future<void> _onSignOut(
    AccountSignOutEvent event,
    Emitter<AccountState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AccountStatus.loading));
      await _repository.signOut();
      emit(state.copyWith(status: AccountStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.error));
      addError(e);
    }
  }

  Future<void> _onUserNameChanged(
    AccountUserNameChangeEvent event,
    Emitter<AccountState> emit,
  ) async {
    try {
      final userName = UserName.dirty(event.userName);
      emit(
        state.copyWith(
          status: AccountStatus.edit,
          userName: userName,
          valid: Formz.validate([userName, state.companyName]),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.error));
      addError(e);
    }
  }

  Future<void> _onCompanyNameChanged(
    AccountCompanyNameChangeEvent event,
    Emitter<AccountState> emit,
  ) async {
    try {
      final companyName = CompanyName.dirty(event.companyName);
      emit(
        state.copyWith(
          status: AccountStatus.edit,
          companyName: companyName,
          valid: Formz.validate([companyName, state.userName]),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AccountStatus.error));
      addError(e);
    }
  }
}
