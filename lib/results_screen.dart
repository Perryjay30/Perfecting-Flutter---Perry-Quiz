import 'package:flutter/material.dart';
import 'package:perry_quiz/data/quiz_questions.dart';



class ResultsScreen extends StatelessWidget {
  ResultsScreen({super.key, required this.chosenAnswers});

  List<String> chosenAnswers = [];

  List<Map<String, Object>> getSummaryData() {
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
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container (
        margin: const EdgeInsets.all(40),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y questions correctly!!'),
            const SizedBox(height: 30,),
            const Text('List of answers and Questions...'),
            const SizedBox(height: 30,),
            TextButton(onPressed: () {}, child: const Text('Restart Quiz!.'),
            )
          ],
        ),
      ),
    );
  }
}