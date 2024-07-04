import 'package:flutter/material.dart';
import 'package:perry_quiz/data/quiz_questions.dart';
import 'package:perry_quiz/questions_screen.dart';
import 'package:perry_quiz/results_screen.dart';

import 'launch_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = LaunchScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = LaunchScreen(switchScreen);
    if(activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if(activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.blueAccent
          ),
        // body: activeScreen == 'start-screen'
        //     ? LaunchScreen(switchScreen)
        //     : const Questions(),
          child: screenWidget,
        ),
      ),
    );
  }
}