import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/screens/review_screen.dart';

import '../services/cognito_service.dart';

class ScoreScreen extends StatefulWidget {
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
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CognitoService cognitoService = CognitoService();

  Future<String?> _getUsername() async {
    try {
      final currentUser = await cognitoService.getCurrentUser();
      if (currentUser != null) {
        final session = await currentUser.getSession();
        final email = session!.getIdToken().payload['email'];
        print('Current user email: $email');
        if (email != null) {
          return email;
        }
      }
      return null;
    } catch (e) {
      print('Error getting username: $e');
      return null;
    }
  }

  Future<void> _saveQuizResults() async {
    try {
      final username = await _getUsername();
      if (username == null) {
        print('Error: Username is null');
        return;
      }

      await _firestore
          .collection('users')
          .doc(username)
          .collection('quiz_results')
          .add({
        'userId': await CognitoService.getCurrentUserId(),
        'timestamp': Timestamp.now(),
        'correctAnswers': widget.correctAnswers,
        'totalQuestions': widget.totalQuestions,
        'percentage': widget.percentage,
        'averageTime': widget.averageTime,
        'questionTimes': widget.questionTimes,
        'answeredQuestions': widget.answeredQuestions,
      });
    } catch (e) {
      print('Error saving quiz results: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    _saveQuizResults();
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Quiz Results',
              style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.w600)),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
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
                            const SizedBox(height: 30),
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
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 32.0,
                    ),
                    child: Column(
                      children: [
                        _buildScoreText(),
                        const SizedBox(height: 30),
                        _buildActionButtons(context),
                        const SizedBox(height: 30),
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
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.blue.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Your Score',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '${widget.correctAnswers} / ${widget.totalQuestions}',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: _getScoreColor(widget.percentage),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: _getScoreColor(widget.percentage).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${widget.percentage.toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 20,
                color: _getScoreColor(widget.percentage),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeDisplay(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                '${widget.averageTime.toStringAsFixed(1)} sec avg',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Time per Question',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.questionTimes.length,
                itemBuilder: (context, index) => _buildTimeListItem(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeListItem(int index) {
    final time = widget.questionTimes[index];
    final timeText =
        time < 60 ? '$time sec' : '${(time / 60).floor()}m ${time % 60}s';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            Icons.timer_outlined,
            size: 18,
            color: time > 30 ? Colors.red[400] : Colors.green[400],
          ),
          const SizedBox(width: 12),
          Text(
            'Q${index + 1}',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          const Spacer(),
          Text(
            timeText,
            style: TextStyle(
              color: time > 30 ? Colors.red[400] : Colors.green[400],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            widget.restartQuiz();
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size(220, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: const Text(
            'Try Again',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextButton.icon(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ReviewScreen(
                  answeredQuestions: widget.answeredQuestions,
                  totalCorrect: widget.correctAnswers,
                  onRestartQuiz: widget.restartQuiz,
                ),
              ),
            );
          },
          icon: const Icon(Icons.rate_review_outlined),
          label: const Text(
            'Review Answers',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
