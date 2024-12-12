import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final CognitoUser? user;

  const ProfileScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Text(
          'Welcome, ${user?.getUsername() ?? 'User'}!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
