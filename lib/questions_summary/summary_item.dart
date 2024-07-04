import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perry_quiz/questions_summary/questions_identifier.dart';


class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];

    int theQuestionIndex;
    try {
      theQuestionIndex = itemData['question'] as int;
      print('Questions Increment');
    } catch (e) {
      theQuestionIndex = 1;
      print('Questions Decrement');// or handle it in some other appropriate way
    }
    return Padding(
      padding: const EdgeInsets.symmetric (
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (theQuestionIndex != -1)  // Only show if questionIndex is valid
            QuestionIdentifier(
              isCorrectAnswer: isCorrectAnswer,
              questionIndex: theQuestionIndex,
            ),
        const SizedBox(width: 20,),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(itemData['question'] as String,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 5,),
            Text(itemData['user_answer'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 202, 171, 252),
              ),
            ),
            Text(itemData['correct_answer'] as String,
              style: const TextStyle(
                color: Color.fromARGB(255, 181, 254, 246),
              ),
            ),
          ],
        )
        ),
      ]),
    );
  }
}