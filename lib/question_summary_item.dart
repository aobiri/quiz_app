import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_identifier.dart';

class QuestionSummaryItem extends StatelessWidget {
  const QuestionSummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Row(
        //ensures all items are aligned to the top of the row
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            // Expanded allows the child widget to take up available width.
            //Without which the child widget may grow beyond the available width, breaking the widget.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                      color: Color.fromARGB(255, 211, 209, 215),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemData['user_answer'] as String,
                  style: GoogleFonts.lato(
                    color: Color.fromARGB(255, 184, 155, 237),
                  ),
                ),
                Text(itemData['correct_answer'] as String,
                    style: GoogleFonts.lato(
                        color: Color.fromARGB(255, 111, 195, 134),
                        fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
