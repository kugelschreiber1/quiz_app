import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/shared/gradient_container.dart';
import 'package:quiz_app/screens/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start';
  final List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'question';
    });
  }

  void switchToStart() {
    setState(() {
      activeScreen = 'start';
      selectedAnswers.clear();
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Home(switchScreen);

    if (activeScreen == 'question') {
      screenWidget = Question(
        onSelectAnswer: chosenAnswer,
      );
    }

    if (activeScreen == 'results') {
      screenWidget = Results(
        selectedAnswers: selectedAnswers,
        onRestart: switchToStart,
      );
    }

    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body: GradientContainer(
          colors: const <Color>[
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 89, 6, 141),
          ],
          beginPosition: Alignment.topLeft,
          endPosition: Alignment.bottomRight,
          child: screenWidget,
        ),
      ),
    );
  }
}
