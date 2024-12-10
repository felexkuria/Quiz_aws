import 'package:flutter/material.dart';
import 'package:quizapp/screens/reviewscreen.dart';

class ScoreScreen extends StatelessWidget {
  // Changed to StatelessWidget
  final int correctAnswers;
  final int totalQuestions;
  final VoidCallback restartQuiz;
  final List<Map<String, dynamic>> answeredQuestions;
  final List<int> questionTimes;

  // Compute these values once
  final double percentage;
  final double averageTime;

  ScoreScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.restartQuiz,
    required this.answeredQuestions,
    required this.questionTimes,
  })  : percentage = (correctAnswers / totalQuestions) * 100,
        averageTime = questionTimes.isEmpty
            ? 0
            : questionTimes.reduce((a, b) => a + b) / questionTimes.length;

  // Extract reusable widget methods
  Widget _buildScoreText() {
    return Column(
      children: [
        const Text(
          'Your Score',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 40),
        Text(
          '$correctAnswers / $totalQuestions',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${percentage.toStringAsFixed(2)}%',
          style: const TextStyle(
            fontSize: 24,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTimeDisplay(BuildContext context) {
    return Column(
      children: [
        Text(
          'Average time: ${averageTime.toStringAsFixed(1)} seconds',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Time per Question:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: questionTimes.length,
            itemBuilder: (context, index) => _buildTimeListItem(index),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeListItem(int index) {
    final time = questionTimes[index];
    final timeText =
        time < 60 ? '$time seconds' : '${(time / 60).floor()}m ${time % 60}s';

    return ListTile(
      dense: true, // Makes the list items more compact
      leading: const Icon(
        Icons.timer,
        size: 16,
        color: Colors.grey,
      ),
      title: Text('Question ${index + 1}'),
      subtitle: Text(
        timeText,
        style: TextStyle(
          color: time > 30 ? Colors.red : Colors.green,
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: restartQuiz,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 45),
          ),
          child: const Text(
            'Restart Quiz',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ReviewScreen(
                answeredQuestions: answeredQuestions,
                totalCorrect: correctAnswers,
                onRestartQuiz: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          child: const Text(
            'Review Your Answers:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            children: [
              _buildScoreText(),
              const SizedBox(height: 20),
              _buildActionButtons(context),
              const SizedBox(height: 20),
              Expanded(
                child: _buildTimeDisplay(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
