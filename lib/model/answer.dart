// lib/model/answer.dart
class Answer {
  String? selectedAnswer;
  String answerState;
  String? explanation;

  Answer({
    this.selectedAnswer,
    this.answerState = 'unanswered',
    this.explanation,
  });

  void submitAnswer(
    String selected,
    String selectedOption, {
    required bool isCorrect,
    String? explanation,
  }) {
    selectedAnswer = selected;
    answerState = isCorrect ? 'correct' : 'wrong';
    this.explanation = explanation;
  }

  void resetAnswer() {
    selectedAnswer = null;
    answerState = 'unanswered';
    explanation = null;
  }
}
