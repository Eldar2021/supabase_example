import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppAuthenticatedEvent>(_onAuthenticated);
    on<AppUnAuthenticatedEvent>(_onLogout);
  }

  void _onAuthenticated(AppAuthenticatedEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(status: AppStatus.authenticated));
  }

  void _onLogout(AppUnAuthenticatedEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(status: AppStatus.unauthenticated));
  }
}
