import 'package:flutter/material.dart';
import 'package:quizapp/model/answer.dart';

class CorrectAnswerWidget extends StatelessWidget {
  final String answerState;
  final String? explanation;

  const CorrectAnswerWidget({
    super.key,
    required this.answerState,
    this.explanation,
    required Answer answer,
  });

  Widget _buildAnswerFeedback() {
    switch (answerState) {
      case 'correct':
        return const _FeedbackRow(
          icon: Icons.check_circle_outline,
          color: Colors.green,
          message: 'Well Done!',
        );
      case 'wrong':
        return const _FeedbackRow(
          icon: Icons.cancel_outlined,
          color: Colors.red,
          message: 'Oops! Try Again!',
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAnswerFeedback(),
          if (explanation != null && explanation!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                explanation!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}

class _FeedbackRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String message;

  const _FeedbackRow({
    required this.icon,
    required this.color,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            message,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
