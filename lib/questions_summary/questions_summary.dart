import 'package:flutter/material.dart';
import 'package:perry_quiz/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {

  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView (
        child: Column(
          children: summaryData.map((data) {
            final index = summaryData.indexOf(data);
            return SummaryItem(
              data,
              questionIndex: index, // Pass the current index
            );
          }).toList(),
        ),
      ),
    );
  }
}