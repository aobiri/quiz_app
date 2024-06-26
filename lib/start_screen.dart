import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // takes the minimal available vertical height
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(155, 255, 255, 255),
          ),
          // --- Opacity is efficient. Avoid if possible
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 240,
          //   ),
          // ),

          const SizedBox(
            height: 80,
          ),

          const Text(
            'Learn Flutter the fun way',
            style: TextStyle(
              color: Color.fromARGB(255, 212, 203, 203),
              fontSize: 20,
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, // text color
            ),
            icon: const Icon(Icons.arrow_right_alt),
            //child: const Text('Start Quiz'),
            label: const Text('Start Quiz'),
          )

          //child: Center(Text('Learn Flutter', style: TextStyle(fontSiz),),)
        ],
      ),
    );
  }
}
