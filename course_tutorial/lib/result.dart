import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetScore;

  Result(this.resultScore, this.resetScore);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 10)
      resultText = "Nice one!";
    else
      resultText = "Too bad!";

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        FlatButton(
          child: Text('Restart quiz!'),
          onPressed: resetScore,
        )
      ],
    ));
  }
}
