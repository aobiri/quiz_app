import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectedAnswer,
  });

  final void Function(String answer) onSelectedAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // the widget is a property of the State class provided by dart to allow access to properties of the StatefulWidget class
    widget.onSelectedAnswer(selectedAnswer);

    // Increment options:
    // 1) currentQuestionIndex = currentQuestionIndex + 1;
    // 2) currentQuestionIndex += 1;
    // 3): currentQuestionIndex++;

    // setState tells Flutter that the build method should be executed again
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //use as much width as needed
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // stretch the Column to fill the entire width of the screen
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 160, 139, 244),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledList().map((answer) {
              // using spread operator(...) - used to get the a list of items and add them as comma-separated items
              // with named arguments, I can access AnswerButton arguments by name
              return AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  }
                  //answerQuestion, // no () because, not calling the function. Just passing it as an argument
                  );
            }),
          ],
        ),
      ),
    );
  }
}
