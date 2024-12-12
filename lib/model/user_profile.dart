// lib/models/user_profile.dart

import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class UserProfile {
  final String userId;
  final String email;
  final List<ExamHistory> examHistory;
  final bool isLoggedIn;

  UserProfile({
    required this.userId,
    required this.email,
    this.examHistory = const [],
    this.isLoggedIn = false,
    required String username,
  });

  // Create profile from Cognito user
  factory UserProfile.fromCognitoUser(CognitoUser user) {
    return UserProfile(
      userId: user.getUsername() ?? '',
      email: user.getUsername() ?? '',
      isLoggedIn: true,
      username: '',
    );
  }

  // Create logged out profile
  factory UserProfile.loggedOut() {
    return UserProfile(
      userId: '',
      email: '',
      isLoggedIn: false,
      username: '',
    );
  }
}

class ExamHistory {
  final String examId;
  final double score;
  final DateTime dateCompleted;

  ExamHistory({
    required this.examId,
    required this.score,
    required this.dateCompleted,
  });
}
