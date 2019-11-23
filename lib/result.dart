import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  Result(this.resultScore);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 9) {
      resultText = 'Thats almost close';
    } else if (resultScore <= 10) {
      resultText = 'Booya!';
    } else if (resultScore <= 12) {
      resultText = 'Awesome';
    } else {
      resultText = 'hmm very strange';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
