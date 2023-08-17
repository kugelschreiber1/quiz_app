import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/shared/gradient_container.dart';

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
          children: <Widget>[
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              fit: BoxFit.contain,
              color: const Color.fromARGB(100, 255, 255, 255),
            ),
            const SizedBox(
              height: 80,
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
            const SizedBox(
              height: 60,
            ),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                side: const BorderSide(
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
