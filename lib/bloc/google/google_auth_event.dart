part of 'google_auth_bloc.dart';

sealed class GoogleAuthEvent extends Equatable {
  const GoogleAuthEvent();

  @override
  List<Object> get props => [];
}

class GoogleSignInRequested extends GoogleAuthEvent {
  const GoogleSignInRequested();
}

class GoogleSignOutRequested extends GoogleAuthEvent {
  const GoogleSignOutRequested();
}
