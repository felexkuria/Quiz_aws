import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizapp/data/questions_data.dart';
import 'package:quizapp/model/answer.dart';
import 'package:quizapp/model/question.dart';
import 'package:quizapp/screens/score_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final Answer _answer = Answer();
  final List<Question> _questions = dummyQuestions;
  int _currentQuestionIndex = 0;
  int _correctAnswer = 0;
  int _incorrectAnswer = 0;
  int _remainingTime = 520;
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState

    _startTimer();
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _remainingTime == 30;
        _answer.resetAnswer();
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ScoreScreen(
              correctAnswers: _correctAnswer,
              totalQuestions: _questions.length,
              restartQuiz: _restartQuiz, // Pass the restart function
            ),
          ),
        );
      }
    });
  }

  // Start the countdown timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        // Time's up, automatically move to the next question
        _nextQuestion();
        _timer.cancel();
      }
    });
  }

  void _submitAnswer(Question question, String selectedOption) {
    setState(() {
      _remainingTime = 30;
      if (selectedOption == question.correctAnswer) {
        _correctAnswer++;
        _answer.submitAnswer(question, selectedOption, isCorrect: true);
      } else {
        _incorrectAnswer++;
        _answer.submitAnswer(question, selectedOption, isCorrect: false);
      }
    });
  }

  // Function to restart the quiz
  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0; // Reset to the first question
      _correctAnswer = 0; // Reset correct answers
      _incorrectAnswer = 0; // Reset incorrect answers
      _answer.resetAnswer(); // Reset answer state
    });
  }

  // Stop the timer when navigating away from this screen
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final questionData = _questions[_currentQuestionIndex];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Text('Time Remaining: $_remainingTime seconds'),
            Text(
              questionData.questionText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 40),
            for (var option in questionData.options)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ElevatedButton(
                  onPressed: _answer.answerState == 'unanswered'
                      ? () {
                          _submitAnswer(questionData, option);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _answer.selectedAnswer == option
                        ? (_answer.answerState == 'correct'
                            ? Colors.green
                            : Colors.red)
                        : Colors.white,
                    side: BorderSide(
                      color: _answer.selectedAnswer == option
                          ? (_answer.answerState == 'correct'
                              ? Colors.green
                              : Colors.red)
                          : Colors.black.withOpacity(0.3),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          _answer.selectedAnswer == option
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: _answer.selectedAnswer == option
                              ? (_answer.answerState == 'correct'
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
            const SizedBox(height: 30),
            if (_answer.answerState != 'unanswered')
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (_answer.answerState == 'correct')
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 30,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Well Done!',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    if (_answer.answerState == 'wrong')
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cancel,
                            color: Colors.red,
                            size: 30,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Oops! Try Again!',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 10),
                    Text(
                      _answer.explanation,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            if (_answer.answerState != 'unanswered')
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                          color: Colors.black.withOpacity(0.2), width: 1),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Next Question',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
