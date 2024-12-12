import 'package:flutter/material.dart';
import '../widgets/quiz_button.dart';
import '../services/cognito_service.dart'; // Add import for cognito service

class StartScreen extends StatelessWidget {
  final void Function(String) startQuiz;
  final String? username;
  final CognitoService _cognitoService =
      CognitoService(); // Add service instance

  StartScreen({super.key, required this.startQuiz, this.username});

  Future<String?> _getUsername() async {
    try {
      final currentUser = await _cognitoService.getCurrentUser();
      if (currentUser != null) {
        final session = await currentUser.getSession();
        final email = session!.getIdToken().payload['email'];
        print('Current user email: $email');
        if (email != null) {
          return email;
        }
        //  return
        // return _cognitoService._generateUsername(email);
      }
      return null;
    } catch (e) {
      print('Error getting username: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: _getUsername(),
        builder: (context, snapshot) {
          final displayName = snapshot.data ?? 'Guest';

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Image.asset(
                      'assets/images/aws.png',
                      width: 200,
                    ),
                  ),
                  Text(
                    "Hello $displayName",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Test Your AWS Knowledge",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 40),
                  QuizButton(
                    title: "AWS Cloud Practitioner",
                    icon: Icons.cloud,
                    onPressed: () {
                      startQuiz('AWS Cloud Practitioner');
                    },
                  ),
                  const SizedBox(height: 20),
                  QuizButton(
                    title: "AWS Solutions Architect",
                    icon: Icons.build,
                    onPressed: () {
                      //  startQuiz('AWS Solutions Architect');
                    },
                  ),
                  const SizedBox(height: 20),
                  QuizButton(
                    title: "AWS Developer Associate",
                    icon: Icons.code,
                    onPressed: () {
                      //  startQuiz('AWS Developer Associate');
                    },
                  ),
                  const SizedBox(height: 40),
                  QuizButton(
                    title: "Start Here",
                    icon: Icons.play_arrow,
                    onPressed: () {
                      // startQuiz('Default Exam');
                    },
                    isPrimary: true,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
