import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ), // ElevatedButton.styleFrom
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
