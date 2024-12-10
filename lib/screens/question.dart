import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/screens/quizscreen.dart';
import 'package:quizapp/widgets/answer.dart';
import 'package:quizapp/widgets/questionwidget.dart';
import '../data/questions_data.dart';
import '../model/answer.dart';
import '../model/question.dart';
import 'score_screen.dart';
import '../widgets/correctanswer.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.examName,
  });
  final String examName;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // Constants
  static const int _initialTime = 30;
  static const double _verticalSpacing = 20.0;
  static const double _horizontalPadding = 20.0;

  // State variables
  final Answer _answer = Answer();
  final List<Question> _questions = dummyQuestions;
  final List<Map<String, dynamic>> _answeredQuestions = [];

  late Timer _timer;
  late DateTime _questionStartTime;

  int _currentQuestionIndex = 0;
  int _correctAnswer = 0;
  int _incorrectAnswer = 0;
  int _remainingTime = _initialTime;

  @override
  void initState() {
    super.initState();
    _startNewQuestion();
  }

  void _startNewQuestion() {
    _questionStartTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_remainingTime > 0) {
          setState(() => _remainingTime--);
        } else {
          _handleTimeUp();
        }
      },
    );
  }

  void _handleTimeUp() {
    _nextQuestion();
    _timer.cancel();
  }

  void _recordAnswer({
    required String question,
    required String selectedOption,
    required String correctAnswer,
    required bool isCorrect,
    required int timeTaken,
  }) {
    _answeredQuestions.add({
      'question': question,
      'selectedOption': selectedOption,
      'correctAnswer': correctAnswer,
      'isCorrect': isCorrect,
      'timeTaken': timeTaken,
    });
  }

  void _nextQuestion() {
    final questionTimeTaken =
        DateTime.now().difference(_questionStartTime).inSeconds;

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _remainingTime = _initialTime;
        _answer.resetAnswer();
      });
      _startNewQuestion();
    } else {
      _navigateToScoreScreen();
    }

    _recordAnswer(
      question: _questions[_currentQuestionIndex].questionText,
      selectedOption: _answer.selectedAnswer ?? "No Answer",
      correctAnswer: _questions[_currentQuestionIndex].correctAnswer,
      isCorrect: _answer.answerState == 'correct',
      timeTaken: questionTimeTaken,
    );
  }

  void _navigateToScoreScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreScreen(
          correctAnswers: _correctAnswer,
          totalQuestions: _questions.length,
          restartQuiz: _restartQuiz,
          answeredQuestions: _answeredQuestions,
          questionTimes: _answeredQuestions
              .map<int>((q) => q['timeTaken'] as int)
              .toList(),
        ),
      ),
    );
  }

  void _submitAnswer(Question question, String selectedOption) {
    final bool isCorrect = selectedOption == question.correctAnswer;

    setState(() {
      _remainingTime = _initialTime;
      isCorrect ? _correctAnswer++ : _incorrectAnswer++;
      _answer.submitAnswer(question.questionText, selectedOption,
          isCorrect: isCorrect);
    });
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _correctAnswer = 0;
      _incorrectAnswer = 0;
      _remainingTime = _initialTime;
      _answeredQuestions.clear();
      _answer.resetAnswer();
    });
    _startNewQuestion();
    Navigator.pop(context); // Return to quiz screen
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget _buildQuestionScreen() {
    final questionData = _questions[_currentQuestionIndex];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: _horizontalPadding,
          vertical: 40.0,
        ),
        child: Column(
          children: [
            _buildTimerWidget(),
            QuestionWidget(question: questionData),
            const SizedBox(height: 40),
            _buildAnswersWidget(questionData),
            const SizedBox(height: _verticalSpacing),
            // CorrectAnswerWidget(answer: _answer, answerState: '',),
            if (_answer.answerState != 'unanswered') _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimerWidget() {
    return Text(
      'Time Remaining: $_remainingTime seconds',
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _buildAnswersWidget(Question questionData) {
    return AnswersWidget(
      question: questionData,
      answer: _answer,
      onAnswerSelected: (selectedOption) =>
          _submitAnswer(questionData, selectedOption),
    );
  }

  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _verticalSpacing),
      child: ElevatedButton(
        onPressed: _nextQuestion,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.black.withOpacity(0.2), width: 1),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.examName == "AWS Cloud Practitioner"
        ? _buildQuestionScreen()
        : const QuizScreen();
  }
}
