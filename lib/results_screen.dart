import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz,
      {super.key, required this.theChosenAnswers});

  final List<String> theChosenAnswers;
  final void Function() restartQuiz;

  // method to get a summary of the quiz taken
  // List<Map<String, Object>> get summaryData{} // Getter approach
  // access like a property like this: number = summaryData.length;
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < theChosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': theChosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData(); // called once for reuse. Manage memory
    final totalNumberOfQuestions = questions.length;
    final numberOfAnsweredQuestions = summaryData
        .where((data) =>
                data['user_answer'] == data['correct_answer'] //arrow function
            // the where method of List is use to filter a list.
            // it returns true of false based on the filter criteria
            )
        .length;

    return SizedBox(
      width: double.infinity, //use as much width as needed
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numberOfAnsweredQuestions out of $totalNumberOfQuestions questions correctly',
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 175, 146, 238),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
