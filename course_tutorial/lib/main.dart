import 'package:course_tutorial/result.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

/*
  A stateless widget is a widget that describes part of the user interface by building a 
  constellation of other widgets that describe the user interface more concretely.
*/
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  final _questions = const [
    {
      'questionText': "What\'s your favorite color?",
      'answer': [
        {"text": "Red", 'score': 1},
        {"text": "Black", 'score': 4},
        {"text": "Green", 'score': 7},
        {"text": "White", 'score': 10}
      ],
    },
    {
      'questionText': "What\'s your favorite animal?",
      'answer': [
        {'text': "Dog", 'score': 1},
        {'text': "Cat", 'score': 2},
        {'text': "Bird", 'score': 7},
        {'text': "Hourse", 'score': 51},
      ],
    },
    {
      'questionText': "Whos\s your favorite instructor?",
      'answer': [
        {'text': "V", 'score': 3}, 
        {'text': "Max", 'score': 2}, 
        {'text': "Dante", 'score': 6}, 
        {'text': "Ruben", 'score': 9}
      ],
    }
  ];
  var _totalScore = 0;

  void _incQuestionIndex(int score) {
    setState(() {
      _questionIndex = (_questionIndex + 1);
      _totalScore += score;
    });
  }

  void _resetQuiz() 
  {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override // Provided by dart
  Widget build(BuildContext context) {
    // Base setup
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                incQuestionIndex: _incQuestionIndex,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            // ':' equals to 'else'
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
