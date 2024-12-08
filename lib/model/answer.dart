import 'package:quizapp/model/question.dart';

class Answer {
  String? selectedAnswer;
  // The answer selected by the user
  bool isCorrect = false;
  String answerState =
      'unanswered'; // Tracks the state: 'unanswered', 'correct', 'wrong'
  String explanation = ''; // Explanation for the answer state

  // Method to submit the answer and update the state
  void submitAnswer(Question question, String answer,
      {required bool isCorrect}) {
    selectedAnswer = answer;

    if (answer == question.correctAnswer) {
      answerState = 'correct';
      explanation = 'Well Done! ${question.correctAnswer} is correct.';
    } else {
      answerState = 'wrong';
      explanation = 'Oops! ${question.correctAnswer} is the right answer.';
    }
  }

// Reset the answer state for a new question
  void resetAnswer() {
    selectedAnswer = null;
    answerState = 'unanswered';
    explanation = '';
  }
}
