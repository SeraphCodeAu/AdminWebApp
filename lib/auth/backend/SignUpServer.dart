import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpServer {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserWithEmailAndPassword(String email, String password, String? contractor) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await _firestore.collection('adminUsers').add({
          'c_name': contractor,
          'email': email,
          'isApproved': false,
        });
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An error occurred during sign-up';
    } catch (e) {
      throw 'An error occurred during sign-up';
    }
  }
}
