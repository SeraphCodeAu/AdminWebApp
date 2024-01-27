import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'SignIn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _selectedContractor;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DropdownMenuItem<String>> _dropdownMenuItems = [];

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
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        await _firestore.collection('adminUsers').add({
          'c_name': _selectedContractor,
          'email': _emailController.text,
          'isApproved': false,
        });

        // Navigate to SignInPage after successful sign up
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const SignInPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'An error occurred')),
      );
    } catch (e) {
      print(e); // For debugging
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again later.')),
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
