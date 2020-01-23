import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String,Object>> questions;
  final Function incQuestionIndex;
  final int questionIndex;

  Quiz({
    @required this.incQuestionIndex, 
    @required this.questions, 
    @required this.questionIndex
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => incQuestionIndex(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
