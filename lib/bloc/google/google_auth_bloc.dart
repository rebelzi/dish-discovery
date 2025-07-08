import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_auth_event.dart';
part 'google_auth_state.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  GoogleAuthBloc() : super(const GoogleAuthInitialState()) {
    // Handle Google Sign In
    on<GoogleSignInRequested>((event, emit) async {
      emit(const GoogleAuthLoadingState());

      try {
        // Initialize Google Sign In dengan scopes
        await _googleSignIn.initialize(
          // clientId bisa dikosongkan jika sudah dikonfigurasi di Firebase
        );

        // Start the sign-in process
        final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();

        if (googleUser == null) {
          emit(const GoogleAuthErrorState('Sign in dibatalkan'));
          return;
        }

        // Get authentication details
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Create Firebase credential
        final credential = GoogleAuthProvider.credential(
          // accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        
        // Sign in to Firebase
        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        
        emit(GoogleAuthSuccessState(userCredential.user!));
      } catch (e) {
        emit(GoogleAuthErrorState('Google Sign In failed: ${e.toString()}'));
      }
    });

    // Handle Google Sign Out
    on<GoogleSignOutRequested>((event, emit) async {
      emit(const GoogleAuthLoadingState());
      
      try {
        await _auth.signOut();
        await _googleSignIn.signOut();
        emit(const GoogleAuthSignedOutState());
      } catch (e) {
        emit(GoogleAuthErrorState('Sign Out failed: ${e.toString()}'));
      }
    });
  }
}
