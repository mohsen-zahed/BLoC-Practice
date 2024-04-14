import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      String name = event.name;
      String email = event.email;
      if (name != 'amir') {
        return emit(
          AuthFailure('name does not match, double check your name!'),
        );
      } else if (name.isEmpty) {
        return emit(AuthFailure('enter your name first!'));
      }
      if (email.isEmpty) {
        return emit(AuthFailure('enter your email first!'));
      } else if (!email.endsWith('@gmail.com')) {
        return emit(AuthFailure('double check your email'));
      }
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(
          AuthSuccessful(name: name, email: email),
        );
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      return emit(
        AuthFailure(e.toString()),
      );
    }
  }
}
