import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/frontend/SignIn.dart';
import 'home/home.dart';
// Import your HomePage here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCKEoBFQ-fVdj_21-74yjD2pzzQ6rq8SoA",
      projectId: "postie-plus",
      messagingSenderId: "912647907356",
      appId: "1:912647907356:web:bc1f409212f4df329517d9",
    ),
  );

  // Check if the user is already signed in
  FirebaseAuth.instance.authStateChanges().first.then((user) {
    runApp(MyApp(user: user));
  });
}

class MyApp extends StatelessWidget {
  final User? user;

  const MyApp({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Postie Web App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: user == null ? const SignInPage() : HomePage(), // Replace HomePage with your home page widget
    );
  }
}
