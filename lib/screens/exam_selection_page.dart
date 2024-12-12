import 'package:flutter/material.dart';
import 'package:quizapp/model/question.dart';
import 'package:quizapp/screens/question_screen.dart';

import '../data/practice_exam.dart';
import '../data/questions_data.dart';

class ExamSelectionPage extends StatefulWidget {
  const ExamSelectionPage({super.key});

  @override
  State<ExamSelectionPage> createState() => _ExamSelectionPageState();
}

class _ExamSelectionPageState extends State<ExamSelectionPage> {
  void selectExam(int examNumber, String examName) {
    List<Question> questions =
        examNumber == 1 ? practiceQuestions : dummyQuestions;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionScreen(
          examName: examName,
          questions: questions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[50]!,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Practice Exams',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Select an exam to begin',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _ExamButton(
                    title: 'Practice Exam 1',
                    onTap: () => selectExam(1, "AWS Cloud Practitioner"),
                  ),
                  const SizedBox(height: 16),
                  _ExamButton(
                    title: 'Practice Exam 2',
                    onTap: () => selectExam(2, "AWS Cloud Practitioner"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ExamButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _ExamButton({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
