import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}
//. void main() => runApp(MyApp());  --- A shorthand for a function with single line .//

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState(); // _ represents private widget
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      // { } represents a Map(with Key-Value pairs)
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 3},
        {'text': 'Elephant', 'score': 7},
        {'text': 'Lion', 'score': 20}
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10},
        {'text': 'Max', 'score': 10}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _restQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

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

  @override // Not required to write this but its better to write this
  Widget build(BuildContext context) {
    // Returs a widget
    return MaterialApp(
      home: Scaffold(
        // Scaffold(a widget) has basic page styling
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,
                _restQuiz), // After colun here is the else part where we display a text at center
      ), // Text('This is my default text!'), Here Text is a class(Widget) not a method and we are passing hello! msg to the constructor
    ); // MaterialApp is a widget created by flutter team
  }
}








// Every widget is just a dart class which in the end has a build method
// *** Always add a comma after closing parentheses because this will allow to autoformat this in a very readable way




