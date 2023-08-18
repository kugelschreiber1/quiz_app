import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/shared/answer_button.dart';
import 'package:quiz_app/shared/gradient_container.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/shared/constants.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
        body: GradientContainer(
      colors: const [
        Color.fromARGB(255, 78, 13, 151),
        Color.fromARGB(255, 89, 6, 141),
      ],
      beginPosition: Alignment.topLeft,
      endPosition: Alignment.bottomRight,
      child: Container(
        constraints: const BoxConstraints.expand(),
        margin: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LinearProgressIndicator(
              value: (currentQuestionIndex + 1) / questions.length,
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              minHeight: 10.0,
              semanticsLabel: 'Questions linear progress indicator',
            ),
            SizedBox(
              height: Constants.getScreenWidth(context) * 0.1,
            ),
            Text(
              currentQuestion.question,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Constants.getScreenWidth(context) * 0.1,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onPressed: () => answerQuestion(answer),
              );
            })
          ],
        ),
      ),
    ));
  }
}
