import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/shared/gradient_container.dart';
import 'package:quiz_app/shared/constants.dart';

class Home extends StatelessWidget {
  const Home(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        colors: const <Color>[
          Color.fromARGB(255, 78, 13, 151),
          Color.fromARGB(255, 89, 6, 141),
        ],
        beginPosition: Alignment.topLeft,
        endPosition: Alignment.bottomRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/quiz-logo.png',
              width: Constants.getScreenWidth(context) * 0.5,
              fit: BoxFit.contain,
              color: const Color.fromARGB(100, 255, 255, 255),
            ),
            SizedBox(
              height: Constants.getScreenWidth(context) * 0.1,
            ),
            Text(
              'Learn Flutter the fun way!',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Constants.getScreenWidth(context) * 0.1),
            OutlinedButton.icon(
              onPressed: startQuiz,
              icon: const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
              label: Text(
                'Start Quiz',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
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
