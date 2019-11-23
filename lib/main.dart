import 'package:academind_flutter/result.dart';
import 'package:flutter/material.dart';
import 'package:academind_flutter/quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(title: 'Survey'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _totalScore = 0;
  var _questions = const [
    {
      'questionText': 'Which network do you use?',
      'answers': [
        {'text': 'MTN', 'score': 3},
        {'text': 'Vodafone', 'score': 5},
        {'text': 'airteltigo', 'score': 3}
      ]
    },
    {
      'questionText': 'Have you used MTN Momo?',
      'answers': [
        {'text': 'yes', 'score': 8},
        {'text': 'no', 'score': 4},
      ]
    },
    {
      'questionText': 'How good is the internet on your mobile device?',
      'answers': [
        {'text': 'very good', 'score': 9},
        {'text': 'good', 'score': 7},
        {'text': 'average', 'score': 5},
        {'text': 'very poor', 'score': 2},
      ]
    },
  ];
  var _questionIndex = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestions: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore)),
    );
  }
}
