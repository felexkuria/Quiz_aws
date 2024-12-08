import 'package:flutter/material.dart';
import 'package:quizapp/data/questions_data.dart';
import 'package:quizapp/model/answer.dart'; // Import the Answer class
import 'package:quizapp/model/question.dart'; // Import the Question model

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // Initialize the Answer object
  final Answer _answer = Answer();

  // List of questions (as an example, you can fetch these dynamically)
  final List<Question> _questions = dummyQuestions;

  int _currentQuestionIndex = 0;

  // Method to go to the next question
  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _answer.resetAnswer();
      } else {
        // Handle the end of quiz (e.g., show score or navigate to result screen)
        // Optionally, handle end of quiz
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Quiz Finished!'),
            content: const Text('Congratulations on finishing the quiz!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionData = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Quiz',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              questionData.questionText,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            for (var option in questionData.options)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ElevatedButton(
                  onPressed: _answer.answerState == 'unanswered'
                      ? () {
                          setState(() {
                            _answer.submitAnswer(questionData, option);
                          });
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _answer.selectedAnswer == option
                        ? (_answer.answerState == 'correct'
                            ? Colors.green
                            : Colors.red)
                        : Colors.white,
                    side: BorderSide(color: Colors.black.withOpacity(0.3)),
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
            // Add this part in the QuestionScreen widget under the ElevatedButton for Next Question
            if (_answer.answerState != 'unanswered')
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Transparent background
                    padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24), // Less padding for a minimal look
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Slightly rounded corners
                      side: BorderSide(
                          color: Colors.black.withOpacity(0.2),
                          width: 1), // Light border with subtle opacity
                    ),
                    elevation: 0, // Remove shadow for a flat, modern look
                  ),
                  child: const Text(
                    'Next Question',
                    style: TextStyle(
                      fontSize: 16, // Simple font size
                      fontWeight:
                          FontWeight.w600, // Slightly bold for readability
                      color: Colors.black, // Dark text for better contrast
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
