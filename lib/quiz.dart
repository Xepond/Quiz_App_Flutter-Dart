import "package:flutter/material.dart";
import "package:quiz_app/data/questions.dart";
import "package:quiz_app/questions_screen.dart";
import "package:quiz_app/results_screen.dart";
import "package:quiz_app/start_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  Widget? activeScreen;

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen =
            ResultsScreen(switchScreen, selectedAnswers, restartQuiz);
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 211, 204, 4),
              Color.fromARGB(255, 4, 13, 113),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: activeScreen,
        ),
      ),
    );
  }
}
