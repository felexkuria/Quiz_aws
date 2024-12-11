import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function(String) startQuiz;
  const StartScreen({super.key, required this.startQuiz});

  @override
  Widget build(BuildContext context) {
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
                width: 200, // Adjusted for a more modern look
              ),
            ),
            const Text(
              "Test Your AWS Knowledge",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            _buildQuizButton(
              context,
              title: "AWS Cloud Practitioner",
              icon: Icons.cloud, // Cloud icon
              onPressed: () => startQuiz('AWS Cloud Practitioner'),
            ),
            const SizedBox(height: 20),
            _buildQuizButton(
              context,
              title: "AWS Solutions Architect",
              icon: Icons.build, // Build icon
              onPressed: () => startQuiz('AWS Solutions Architect'),
            ),
            const SizedBox(height: 20),
            _buildQuizButton(
              context,
              title: "AWS Developer Associate",
              icon: Icons.code, // Code icon
              onPressed: () => startQuiz('AWS Developer Associate'),
            ),
            const SizedBox(height: 40),
            _buildQuizButton(
              context,
              title: "Start Here",
              icon: Icons.play_arrow, // Play button icon for starting
              onPressed: () => startQuiz('Default Exam'),
              isPrimary: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
    bool isPrimary = false,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        foregroundColor: isPrimary ? Colors.white : Colors.black,
        backgroundColor: isPrimary ? Colors.orange : Colors.transparent,
        side: BorderSide(
          color: isPrimary ? Colors.transparent : Colors.black,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      icon: Icon(
        icon,
        size: 30,
        color: isPrimary ? Colors.white : Colors.black,
      ),
      label: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isPrimary ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
