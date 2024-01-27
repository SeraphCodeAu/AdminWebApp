// SignInServer.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignInServer {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Get the user document from Firestore based on email
      final userQuery = await _firestore.collection('adminUsers').where('email', isEqualTo: email).get();

      if (userQuery.docs.isNotEmpty) {
        final userDoc = userQuery.docs.first;
        final isApproved = userDoc['isApproved'];

        if (isApproved == true) {
          // User is approved, so proceed with sign in
          await _auth.signInWithEmailAndPassword(email: email, password: password);
          return true; // Sign in successful
        } else {
          return false; // User not approved
        }
      } else {
        return false; // User document not found
      }
    } on FirebaseAuthException {
      return false; // Firebase Auth Exception
    }
  }
}
