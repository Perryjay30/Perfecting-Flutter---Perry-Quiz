import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perry_quiz/data/quiz_questions.dart';
import 'package:perry_quiz/questions_summary/questions_summary.dart';



class ResultsScreen extends StatelessWidget {

  ResultsScreen({super.key, required this.chosenAnswers,
    required this.onRestart});

  List<String> chosenAnswers = [];

  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'questions_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) =>  //arrow function
      data['user_answer'] == data['correct_answer'],
    ).length;

    return SizedBox(
      width: double.infinity,
      child: Container (
        margin: const EdgeInsets.all(40),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}