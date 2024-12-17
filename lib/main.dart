import 'package:flutter/material.dart';
import 'package:quizapp/firebase_options.dart';
import 'package:quizapp/screens/quiz_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'presentation/routes.dart';
import 'screens/admin/admin_screen.dart';
import 'screens/exam_selection_page.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/signup_screen.dart';
import 'screens/question_screen.dart';
import 'screens/review_screen.dart';
import 'screens/score_screen.dart';
import 'screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: Routes.adminPanel,
    routes: {
      Routes.adminPanel: (context) => AdminPanel(),
      Routes.login: (context) => const LoginScreen(),
      Routes.signup: (context) => SignUpScreen(),
      Routes.examSelection: (context) => const ExamSelectionScreen(),
      //Routes.question: (context) => const QuestionScreen(),
      Routes.quiz: (context) => const QuizScreen(),
      // Routes.review: (context) => const ReviewScreen(),
      // Routes.score: (context) =>  ScoreScreen(),
      Routes.start: (context) => StartScreen(
            startQuiz: (String) {},
          ),
    },
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
        brightness: Brightness.light,
      ),
    ),
    darkTheme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
        brightness: Brightness.dark,
      ),
    ),
    themeMode: ThemeMode.system, // Automatically use device theme settings
  ));
}
