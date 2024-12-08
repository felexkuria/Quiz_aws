import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});
  final VoidCallback startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            'assets/images/aws.png',
            width: 300,

            // color: const Color.fromARGB(149, 254, 254, 250),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          "Test Your AWS Knowledge",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        OutlinedButton.icon(
          onPressed: () {
            startQuiz();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
          label: const Text(
            "Start Here",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: const Icon(
            Icons.start,
            size: 30,
          ),
        ),
      ],
    ));
  }
}
