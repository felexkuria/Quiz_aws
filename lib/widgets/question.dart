import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  // Possible states: unanswered, correct, wrong
  String? _selectedAnswer;
  String _answerState =
      'unanswered'; // Tracks the state: 'unanswered', 'correct', 'wrong'
  String _explanation = '';

  // Sample question and options (you can replace this with dynamic content)
  final String question = "What is Flutter?";
  final List<String> options = [
    'A mobile OS',
    'A framework for building apps',
    'A programming language'
  ];
  final String correctAnswer =
      'A framework for building apps'; // The correct answer

  void _submitAnswer(String answer) {
    setState(() {
      _selectedAnswer = answer;
      if (answer == correctAnswer) {
        _answerState = 'correct';
        _explanation =
            'Well done! Flutter is a framework for building natively compiled applications for mobile, web, and desktop.';
      } else {
        _answerState = 'wrong';
        _explanation =
            'Oops! That\'s incorrect. Flutter is a framework, not a mobile OS or a programming language.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Question'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Display the question
            Text(
              question,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Display the options as buttons
            for (var option in options)
              ElevatedButton(
                onPressed: _answerState == 'unanswered'
                    ? () => _submitAnswer(option)
                    : null, // Disable if answered
                child: Text(option),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedAnswer == option
                      ? (_answerState == 'correct' ? Colors.green : Colors.red)
                      : Colors.blue,
                ),
              ),
            const SizedBox(height: 20),
            // Display explanation after answering
            if (_answerState != 'unanswered')
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _explanation,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
