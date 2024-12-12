// lib/screens/profile_screen.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/user_profile.dart';
import '../services/cognito_service.dart';

class ProfileScreen extends StatelessWidget {
  final CognitoService _cognitoService = CognitoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await _cognitoService.signOut();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: FutureBuilder<UserProfile>(
        future: _loadUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading profile'));
          }

          final profile = snapshot.data!;
          return ListView(
            children: [
              ListTile(
                title: Text('Email'),
                subtitle: Text(profile.email),
              ),
              Divider(),
              Text('Exam History',
                  style: Theme.of(context).textTheme.titleLarge),
              ...profile.examHistory
                  .map((exam) => ListTile(
                        title: Text('Exam ${exam.examId}'),
                        subtitle: Text('Score: ${exam.score}%'),
                        trailing: Text(
                          DateFormat('MM/dd/yyyy').format(exam.dateCompleted),
                        ),
                      ))
                  .toList(),
            ],
          );
        },
      ),
    );
  }

  Future<UserProfile> _loadUserProfile() async {
    // Implement loading user profile from your backend
    // You can use Cognito user attributes and your own backend
    // to store exam history
    throw UnimplementedError();
  }
}
