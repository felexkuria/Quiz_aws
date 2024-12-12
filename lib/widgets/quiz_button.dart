import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isPrimary;

  const QuizButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        foregroundColor: isPrimary ? Colors.white : Colors.black,
        backgroundColor: isPrimary ? Colors.orange : Colors.transparent,
        side: BorderSide(
          color: isPrimary ? Colors.transparent : Colors.black,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      icon: Icon(
        icon,
        size: 30,
        color: isPrimary ? Colors.white : Colors.black,
      ),
      label: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: isPrimary ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
