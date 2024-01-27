import 'package:firebase_auth/firebase_auth.dart';

class SignInServer {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Handle successful sign in, e.g., navigation to the home page
    } on FirebaseAuthException catch (e) {
      // Handle sign-in error
      throw e.message ?? 'An error occurred during sign-in';
    }
  }
}
