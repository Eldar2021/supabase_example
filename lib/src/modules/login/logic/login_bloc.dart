import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:user_repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

typedef EmitLogin = Emitter<LoginState>;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._repository) : super(const LoginState()) {
    on<LoginEmailChangedEvent>(_onEmailChanged);
    on<LoginSubmittedEvent>(_onSignIn);
  }

  final UserRepository _repository;

  void _onEmailChanged(LoginEmailChangedEvent event, EmitLogin emit) {
    final emai = Email.dirty(event.email);

    emit(state.copyWith(email: emai, valid: Formz.validate([emai])));
  }

  Future<void> _onSignIn(LoginSubmittedEvent event, EmitLogin emit) async {
    try {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await _repository.singIn(email: event.email, isWeb: event.isWeb);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      addError(e);
    }
  }
}
