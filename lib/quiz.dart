import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          // We use as List<String> because we need to tell the dart that we are using a list of strings
          return Answer(
              () => answerQuestion(answer[
                  'score']), // We use ananomous function here because we can't call the function here. so we won't be able to pass argument. so we creating a function which calls the req function
              answer[
                  'text']); // ... is added to have only one list and not a nested list
        }).toList()
        //. Answer(_answerQuestion), // Here we are passing answerQuestion as a pointer to the constructor of the Answer class in answer.dart file
        //. Answer(_answerQuestion), .//
        //. Answer(_answerQuestion), .//
      ],
    );
  }
}
