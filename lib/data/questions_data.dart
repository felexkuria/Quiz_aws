// question_list.dart

import '../model/question.dart';

List<Question> dummyQuestions = [
  Question(
    questionText: "What is Flutter?",
    options: [
      'A mobile OS',
      'A framework for building apps',
      'A programming language'
    ],
    correctAnswer: 'A framework for building apps',
  ),
  Question(
    questionText: "What is Dart?",
    options: ['A programming language', 'A framework', 'A database'],
    correctAnswer: 'A programming language',
  ),
  Question(
    questionText: "Who developed Flutter?",
    options: ['Google', 'Microsoft', 'Apple'],
    correctAnswer: 'Google',
  ),
];
