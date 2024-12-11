import 'package:flutter/material.dart';
import 'package:quizapp/screens/reviewscreen.dart';

class ScoreScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;
  final VoidCallback restartQuiz;
  final List<Map<String, dynamic>> answeredQuestions;
  final List<int> questionTimes;

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Results'),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                // Tablet/Desktop layout
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.1,
                    vertical: 40.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            _buildScoreText(),
                            const SizedBox(height: 20),
                            _buildActionButtons(context),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 1,
                        child: _buildTimeDisplay(context),
                      ),
                    ],
                  ),
                );
              } else {
                // Phone layout
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 40.0,
                    ),
                    child: Column(
                      children: [
                        _buildScoreText(),
                        const SizedBox(height: 20),
                        _buildActionButtons(context),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: _buildTimeDisplay(context),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildScoreText() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Your Score',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '$correctAnswers / $totalQuestions',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: _getScoreColor(percentage),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${percentage.toStringAsFixed(2)}%',
            style: TextStyle(
              fontSize: 24,
              color: _getScoreColor(percentage),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeDisplay(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Average time: ${averageTime.toStringAsFixed(1)} seconds',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Time per Question:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                itemCount: questionTimes.length,
                itemBuilder: (context, index) => _buildTimeListItem(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeListItem(int index) {
    final time = questionTimes[index];
    final timeText =
        time < 60 ? '$time seconds' : '${(time / 60).floor()}m ${time % 60}s';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      elevation: 2,
      child: ListTile(
        dense: true,
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
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            restartQuiz();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size(200, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
          ),
          child: const Text(
            'Restart Quiz',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextButton.icon(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ReviewScreen(
                  answeredQuestions: answeredQuestions,
                  totalCorrect: correctAnswers,
                  onRestartQuiz: restartQuiz,
                ),
              ),
            );
          },
          icon: const Icon(Icons.rate_review),
          label: const Text(
            'Review Your Answers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Color _getScoreColor(double percentage) {
    if (percentage >= 80) return Colors.green;
    if (percentage >= 60) return Colors.orange;
    return Colors.red;
  }
}
