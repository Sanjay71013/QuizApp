import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function
      resetHandler; // If final Function gives a erroe then use final VoidCallback -- it is more specific

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    // Getter
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = "You are awesome!";
    } else if (resultScore <= 15) {
      resultText = "Pretty good!";
    } else if (resultScore < 20) {
      resultText = 'You are strange!';
    } else {
      resultText = "You are bad!";
    }
    return resultText;
  }

// press ctrl+ shift + r to open refractor and use wrap with column -- if u want multiple widget which are not nested
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
              textColor: Colors.blue,
              onPressed: resetHandler,
              child: Text('Restart Quiz!'))
        ],
      ),
    );
  }
}
