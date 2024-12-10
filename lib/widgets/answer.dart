import 'package:flutter/material.dart';

import '../model/answer.dart';
import '../model/question.dart';

class AnswersWidget extends StatelessWidget {
  final Question question;
  final Answer answer;
  final ValueChanged<String> onAnswerSelected;

  const AnswersWidget({
    super.key,
    required this.question,
    required this.answer,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var option in question.options)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: ElevatedButton(
              onPressed: answer.answerState == 'unanswered'
                  ? () => onAnswerSelected(option)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: answer.selectedAnswer == option
                    ? (answer.answerState == 'correct'
                        ? Colors.green
                        : Colors.red)
                    : Colors.white,
                side: BorderSide(
                  color: answer.selectedAnswer == option
                      ? (answer.answerState == 'correct'
                          ? Colors.green
                          : Colors.red)
                      : Colors.black.withOpacity(0.3),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      answer.selectedAnswer == option
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: answer.selectedAnswer == option
                          ? (answer.answerState == 'correct'
                              ? Colors.green
                              : Colors.red)
                          : Colors.black.withOpacity(0.6),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      option,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
