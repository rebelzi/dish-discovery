import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    // login request
    on<LoginRequest>((event, emit) async {
      emit(AuthLoading());
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(LoginAuthenticated(userCredential.user!));
      } catch (e) {
        emit(AuthError("Login Gagal: ${e.toString()}"));
        emit(UnAuthenticated());
      }
    });

    // register request
    on<RegisterRequest>((event, emit) async {
      emit(AuthLoading());
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
              email: event.email,
              password: event.password,
            );
        emit(RegisterAuthenticated(userCredential.user!));
      } catch (e) {
        emit(AuthError("Register Gagal: ${e.toString()}"));
        emit(UnAuthenticated());
      }
    });

    // logout request
    on<LogoutRequest>((event, emit) async {
      await _auth.signOut();
      emit(UnAuthenticated());
    });
  }
}
