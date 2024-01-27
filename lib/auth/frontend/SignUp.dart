import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'SignIn.dart';
import '../backend/SignUpServer.dart'; // Import SignUpServer

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _selectedContractor;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DropdownMenuItem<String>> _dropdownMenuItems = [];
  final SignUpServer _signUpServer = SignUpServer();

  @override
  void initState() {
    super.initState();
    _loadContractors();
  }

  Future<void> _loadContractors() async {
    final querySnapshot = await _firestore.collection('contractors').get();
    final items = querySnapshot.docs.map((doc) {
      return DropdownMenuItem<String>(
        value: doc['c_name'],
        child: Text(doc['c_name']),
      );
    }).toList();

    setState(() {
      _dropdownMenuItems = items;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    try {
      await _signUpServer.createUserWithEmailAndPassword(
        _emailController.text,
        _passwordController.text,
        _selectedContractor,
      );

      // Navigate to SignInPage after successful sign up
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SignInPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            DropdownButton<String>(
              value: _selectedContractor,
              hint: Text('Select Contractor'),
              items: _dropdownMenuItems,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedContractor = newValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
