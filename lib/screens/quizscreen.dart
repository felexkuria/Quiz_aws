import 'package:flutter/material.dart';
import 'package:quizapp/screens/startscreen.dart';
import 'package:quizapp/widgets/question.dart';

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
      activeScreen = const Question();
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
