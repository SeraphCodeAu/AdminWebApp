import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      // The body is empty for now, as per your request
      body: Center(
        child: Text('Welcome to the Home Page'),
      ),
    );
  }
}
