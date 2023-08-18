import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/question_summary.dart';
import 'package:quiz_app/shared/gradient_container.dart';
import 'package:quiz_app/shared/constants.dart';
import 'package:quiz_app/data/questions.dart';

class Results extends StatelessWidget {
  const Results(
      {super.key, required this.selectedAnswers, required this.onRestart});

  final void Function() onRestart;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final noTotalQuestions = questions.length;
    final noCorrectAnswers = summaryData.where((element) {
      return element['correct_answer'] == element['chosen_answer'];
    }).length;

    return GradientContainer(
      colors: const <Color>[
        Color.fromARGB(255, 78, 13, 151),
        Color.fromARGB(255, 89, 6, 141),
      ],
      beginPosition: Alignment.topLeft,
      endPosition: Alignment.bottomRight,
      child: Container(
        constraints: const BoxConstraints.expand(),
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You answered $noCorrectAnswers out of $noTotalQuestions questions correctly!",
              style: GoogleFonts.lato(
                fontSize: 20.0,
                color: Colors.deepPurple.shade200,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: Constants.getScreenWidth(context) * 0.1,
            ),
            QuestionSummary(
              summary: summaryData,
            ),
            SizedBox(
              height: Constants.getScreenWidth(context) * 0.1,
            ),
            OutlinedButton.icon(
              onPressed: onRestart,
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  wordSpacing: 2.0,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                shape: const StadiumBorder(),
                side: const BorderSide(
                  width: 3.0,
                  color: Colors.white38,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
