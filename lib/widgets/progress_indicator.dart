import 'package:flutter/material.dart';

import '../model/question.dart';

class ProgressIndicatora extends StatelessWidget {
  const ProgressIndicatora({super.key, required this.questions});
  final List<Question> questions;
  @override
  Widget build(BuildContext context) {
    int currentQuestionIndex = 0;
    return Column(
      children: [
        LinearProgressIndicator(
          value: (currentQuestionIndex + 1) / questions.length,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[700]!),
          borderRadius: BorderRadius.circular(10),
          minHeight: 10,
        ),
        const SizedBox(height: 8),
        Text(
          'Question ${currentQuestionIndex + 1}/${questions.length}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
