import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizapp/screens/quiz_screen.dart';
import 'package:quizapp/widgets/answer.dart';
import 'package:quizapp/widgets/questionwidget.dart';
import '../data/questions_data.dart';
import '../model/answer.dart';
import '../model/question.dart';
import 'score_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.examName,
    required this.questions,
  });
  final String examName;
  final List<Question> questions;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // Constants
  static const int _initialTime = 60;
  static const double _verticalSpacing = 24.0;
  static const double _horizontalPadding = 24.0;

  // State variables
  final Answer _answer = Answer();

  final List<Map<String, dynamic>> _answeredQuestions = [];

  Timer? _timer;
  late DateTime _questionStartTime;

  int _currentQuestionIndex = 0;
  int _correctAnswer = 0;
  int _incorrectAnswer = 0;
  int _remainingTime = _initialTime;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _startNewQuestion();
  }

  void _startNewQuestion() {
    if (_isDisposed) return;
    _questionStartTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isDisposed) {
        timer.cancel();
        return;
      }
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _handleTimeUp();
        }
      });
    });
  }

  void _handleTimeUp() {
    _timer?.cancel();
    if (_isDisposed) return;

    _recordAnswer(
      question: widget.questions[_currentQuestionIndex].questionText,
      selectedOption: "No Answer",
      correctAnswer: widget.questions[_currentQuestionIndex].correctAnswer,
      isCorrect: false,
      timeTaken: _initialTime,
    );
    setState(() {
      _incorrectAnswer++;
    });
    _nextQuestion();
  }

  void _recordAnswer({
    required String question,
    required String selectedOption,
    required String correctAnswer,
    required bool isCorrect,
    required int timeTaken,
  }) {
    if (_isDisposed) return;

    _answeredQuestions.add({
      'question': question,
      'selectedOption': selectedOption,
      'correctAnswer': correctAnswer,
      'isCorrect': isCorrect,
      'timeTaken': timeTaken,
    });
  }

  void _nextQuestion() {
    if (_isDisposed) return;

    final questionTimeTaken =
        DateTime.now().difference(_questionStartTime).inSeconds;

    _recordAnswer(
      question: widget.questions[_currentQuestionIndex].questionText,
      selectedOption: _answer.selectedAnswer ?? "No Answer",
      correctAnswer: widget.questions[_currentQuestionIndex].correctAnswer,
      isCorrect: _answer.answerState == 'correct',
      timeTaken: questionTimeTaken,
    );

    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _remainingTime = _initialTime;
        _answer.resetAnswer();
      });
      _startNewQuestion();
    } else {
      _navigateToScoreScreen();
    }
  }

  void _navigateToScoreScreen() {
    if (_isDisposed) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreScreen(
          correctAnswers: _correctAnswer,
          totalQuestions: widget.questions.length,
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
    if (_isDisposed) return;

    final bool isCorrect = selectedOption == question.correctAnswer;

    setState(() {
      _remainingTime = _initialTime;
      isCorrect ? _correctAnswer++ : _incorrectAnswer++;
      _answer.submitAnswer(question.questionText, selectedOption,
          isCorrect: isCorrect);
    });
  }

  void _restartQuiz() {
    if (_isDisposed) return;

    setState(() {
      _currentQuestionIndex = 0;
      _correctAnswer = 0;
      _incorrectAnswer = 0;
      _remainingTime = _initialTime;
      _answeredQuestions.clear();
      _answer.resetAnswer();
    });
    _startNewQuestion();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _isDisposed = true;
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildQuestionScreen() {
    final questionData = widget.questions[_currentQuestionIndex];

    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade50,
                Colors.white,
              ],
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth > 600
                  ? constraints.maxWidth * 0.1
                  : _horizontalPadding,
              vertical: 40.0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [
                    _buildProgressIndicator(),
                    const SizedBox(height: _verticalSpacing),
                    _buildTimerWidget(),
                    const SizedBox(height: _verticalSpacing),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: QuestionWidget(question: questionData),
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildAnswersWidget(questionData),
                    const SizedBox(height: _verticalSpacing),
                    if (_answer.answerState != 'unanswered') _buildNextButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildProgressIndicator() {
    return Column(
      children: [
        LinearProgressIndicator(
          value: (_currentQuestionIndex + 1) / widget.questions.length,
          backgroundColor: Colors.grey[200],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[700]!),
          borderRadius: BorderRadius.circular(10),
          minHeight: 10,
        ),
        const SizedBox(height: 8),
        Text(
          'Question ${_currentQuestionIndex + 1}/${widget.questions.length}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTimerWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: _remainingTime > 10 ? Colors.blue[700] : Colors.red[700],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.timer,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            '$_remainingTime seconds',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
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
          backgroundColor: Colors.grey[700],
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Next Question',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.examName == "AWS Cloud Practitioner"
          ? _buildQuestionScreen()
          : const QuizScreen(),
    );
  }
}
