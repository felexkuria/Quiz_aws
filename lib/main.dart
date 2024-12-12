import 'package:flutter/material.dart';
import 'package:quizapp/screens/quiz_screen.dart';

import 'screens/login/signup_screen.dart';

void main() {
  runApp(MaterialApp(home: SignUpScreen()));
  runApp(MaterialApp(
    home: SignUpScreen(),
    theme: ThemeData.light(),
    darkTheme: ThemeData.dark(),
    themeMode: ThemeMode.system, // Automatically use device theme settings
  ));
}
// Here’s a list of the **AWS Cloud Practitioner exam preparation features** you were working on:

// ### AWS Cloud Practitioner Practice Exam Features

// 1. **Question Bank**:✅
//    - A collection of multiple-choice questions covering various AWS topics such as:
//      - Cloud Concepts (e.g., AWS Cloud, cloud benefits, virtualization).
//      - Security and Compliance (e.g., IAM, best practices, AWS CloudTrail).
//      - Technology (e.g., AWS services like S3, EC2, Lambda, Auto Scaling).
//      - Billing and Pricing (e.g., AWS pricing models, AWS Free Tier, cost monitoring).

// 2. **Question Display**:✅
//    - Questions presented one at a time, with multiple-choice options.
//    - Dynamically display options like `A`, `B`, `C`, `D`.

// 3. **User Interaction**:✅
//    - Users select their answers for each question.
//    - Immediate feedback on the selected answer (Correct/Incorrect).
//    - A timer to simulate the actual exam experience.

// 4. **Progress Tracking**:✅
//    - Track the user’s progress through the questions (e.g., percentage completed).
//    - A summary page at the end with the total number of correct/incorrect answers.
   
// 5. **Score Calculation**:✅
//    - Calculate the user’s score out of the total number of questions answered.
//    - Option to review answers and correct/incorrect selections after completing the exam.

// 6. **Detailed Results and Explanations**:✅
//    - Provide a brief explanation or additional resources after each answer to explain why it’s correct or incorrect.
//    - Users can view their answers and explanations at the end of the exam.

// 7. **Timed Exam Simulation**:✅
//    - A countdown timer to create a real-world testing scenario.
//    - Alerts when time is running out.

// 8. **Randomized Questions**:❌
//    - Randomly present questions from a pool to make each exam unique for the user.
   
// 9. **User Profiles**:❌
//    - Users can register and log in to track their performance across different practice exams.
//    - A history of all exams taken with scores and progress.

// 10. **Admin Panel**:❌
//     - For adding, editing, or deleting questions in the question bank.
//     - Ability to categorize questions by domain (e.g., Cloud Concepts, Security and Compliance, etc.).
    
// 11. **Analytics and Reporting**:❌
//     - Allow users to see detailed reports on performance (e.g., strengths and weaknesses).
//     - Graphical representation of scores across multiple attempts.

// 12. **Leaderboard** (Optional):❌
//     - A leaderboard to compare user performance with others, if applicable.

