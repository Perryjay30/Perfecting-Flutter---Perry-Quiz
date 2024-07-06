import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class LaunchScreen extends StatelessWidget {

  LaunchScreen(this.startQuiz, {super.key});

  void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
            width: 200,
            // color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 50,),
           Text(style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold
          ),
            'Welcome to Perry Quiz!!',),
          const SizedBox(height: 30,),
          OutlinedButton.icon(onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Begin'))
        ],
      ),
    );
  }
}