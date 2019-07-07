//built in widgets of regular flutter
import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;
  int _questionIndex = 0;
  final _questions = const [
    {
      "questionText": "What\'s your favorite color?",
      "answers": [
        {"text": "Red", "score": 25},
        {"text": "Blue", "score": 33},
        {"text": "Black", "score": 10},
      ]
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 33},
        {"text": "Cat", "score": 33},
        {"text": "Rabbit", "score": 33},
      ]
    },
    {
      "questionText": "What\'s your favorite instructor?",
      "answers": [
        {"text": "Eddie", "score": 33},
        {"text": "Michelle", "score": 25},
        {"text": "Trump", "score": 1},
      ]
    },
  ];
  void _answerQuestion(int score) {
    print('question index: ${_questionIndex}');
    setState(() {
      if (_questionIndex < _questions.length)
        _questionIndex = _questionIndex + 1;
      _totalScore += score;
    });
  }

  void _resetQuestionaire() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    //home is the beginning page
    //Scaffold is a layout
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Questionaire"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                _questions,
                _questionIndex,
                _answerQuestion,
              )
            : Result(_totalScore, _resetQuestionaire),
      ),
    );
  }
}
