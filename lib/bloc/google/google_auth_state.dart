part of 'google_auth_bloc.dart';

abstract class GoogleAuthState extends Equatable {
  const GoogleAuthState();
  
  @override
  List<Object> get props => [];
}

class GoogleAuthInitialState extends GoogleAuthState {
  const GoogleAuthInitialState();
}

class GoogleAuthLoadingState extends GoogleAuthState {
  const GoogleAuthLoadingState();
}

class GoogleAuthSuccessState extends GoogleAuthState {
  final User user;
  
  const GoogleAuthSuccessState(this.user);
  
  @override
  List<Object> get props => [user];
}

class GoogleAuthErrorState extends GoogleAuthState {
  final String message;
  
  const GoogleAuthErrorState(this.message);
  
  @override
  List<Object> get props => [message];
}

class GoogleAuthSignedOutState extends GoogleAuthState {
  const GoogleAuthSignedOutState();
}