import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/SignIn.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInPage(),  // Set SignUpPage as the home
    );
  }
}
