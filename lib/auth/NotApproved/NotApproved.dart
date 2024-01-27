import 'package:flutter/material.dart';

class NotApprovedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Not Approved')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Your account has not been approved yet. Please contact SeraphCode or your Administrator.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
