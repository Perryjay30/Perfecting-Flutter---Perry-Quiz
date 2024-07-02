import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perry_quiz/answer_button.dart';
import 'package:perry_quiz/data/quiz_questions.dart';


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      decoration: const BoxDecoration(
          color: Colors.blueAccent
      ),
      child: Center (
        child: Container (
          margin: const EdgeInsets.all(40),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(currentQuestion.text,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ...currentQuestion.getShuffledAnswers().map((answer) { //Mapping lists and using the spread operator
                  return AnswerButton(answer, () {
                    answerQuestion(answer);
                  });
                })
                // AnswerButton(currentQuestion.answers[0], () {}),
                // AnswerButton(currentQuestion.answers[1], () {}),
                // AnswerButton(currentQuestion.answers[2], () {}),
                // AnswerButton(currentQuestion.answers[3], () {}),
              ],
            )
        )
      ),
    );
  }
}