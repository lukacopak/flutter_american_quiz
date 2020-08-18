import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 7) {
      resultText = 'True American! *cues Hulk Hogan theme song.';
    } else if (resultScore <= 35) {
      resultText = 'Almost, but not that close.';
    } else {
      resultText = 'Fake, not even in your dreams.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text('Restart Quiz'),
              textColor: Colors.teal,
              onPressed: resetHandler)
        ],
      ),
    );
  }
}
