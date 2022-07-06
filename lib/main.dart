// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_tutorials/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'blue', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal',
      'answers': [
        {'text': 'bear', 'score': 10},
        {'text': 'lion', 'score': 5},
        {'text': 'tiger', 'score': 3},
        {'text': 'bear', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favorite instructor',
      'answers': [
        {'text': 'max', 'score': 10},
        {'text': 'reed', 'score': 5},
        {'text': 'john', 'score': 3},
        {'text': 'elu', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Myfirstapp'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: (_answerQuestion),
                  questionIndex: _questionIndex,
                  questions: _questions)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
