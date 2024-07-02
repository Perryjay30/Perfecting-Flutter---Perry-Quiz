import 'package:flutter/material.dart';
import 'package:perry_quiz/questions_screen.dart';

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
  final List<String> selectedAnswers = [];
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
  }

  @override
  Widget build(context) {
    Widget screenWidget = LaunchScreen(switchScreen);
    if(activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
        // body: activeScreen == 'start-screen'
        //     ? LaunchScreen(switchScreen)
        //     : const Questions(),
      ),
    );
  }
}