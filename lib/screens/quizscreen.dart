import 'package:flutter/material.dart';

import 'package:quizapp/screens/startscreen.dart';
import 'package:quizapp/widgets/question.dart';

import '../data/questions_data.dart';
import '../model/answer.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(
      startQuiz: switchScreen,
    );

    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionScreen();
    });
  }

  int _currentQuestionIndex = 0;
  // Initialize the Answer object
  final Answer _answer = Answer();

  void _nextQuestion(int index) {
    setState(() {
      if (_currentQuestionIndex < dummyQuestions.length - 1) {
        _currentQuestionIndex++;
        _answer.resetAnswer();
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 247, 250, 247),
              Color.fromARGB(255, 161, 156, 160),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
