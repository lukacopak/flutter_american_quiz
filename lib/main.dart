import 'package:flutter/material.dart';
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
  final _questions = const [
    {
      'questionText': 'Preferred Animal?:',
      'answers': [
        {'text': 'Donkey', 'score': 10},
        {'text': 'Dog, Cat,..', 'score': 5},
        {'text': 'Bald Eagle, Elephant', 'score': 1},
      ],
    },
    {
      'questionText': 'How many gender are there?',
      'answers': [
        {'text': 'Two', 'score': 1},
        {'text': 'A lot', 'score': 10},
        {'text': 'Don\'t wanna tell, that is politically incorrect to ask', 'score': 8},
      ],
    },
    {
      'questionText': 'Favourite Politician:',
      'answers': [
        {'text': 'Donald J Trump', 'score': 1},
        {'text': 'Hillary Clinton', 'score': 7},
        {'text': 'Don\'t know who they are,I vote for HDZ', 'score': 10},
      ],
    },
    {
      'questionText': 'What do you do when you hear the national anthem?:',
      'answers': [
        {'text': 'Acknowledge it', 'score': 5},
        {'text': 'Ignore it', 'score': 10},
        {'text': 'Bow down on your knee and put your right hand on the heart area ', 'score': 1}
      ],
    },
    {
      'questionText': 'When someone\'s on your property, you?:',
      'answers': [
        {'text': 'Grab your firearm, and then ask questions','score': 1},
        {'text': 'Have a conversation', 'score': 10},
      ],
    },
    {
      'questionText': 'Best word?:',
      'answers': [
        {'text': 'PC', 'score': 10},
        {'text': 'Freedom', 'score': 1},
        {'text': 'Better gun laws', 'score': 10},
      ],
    },
    {
      'questionText': 'Bonus question: Corona virus?:',
      'answers': [
        {'text': 'Hoax', 'score': 1},
        {'text': '5G towers are causing it', 'score': 1},
        {'text': 'Real', 'score': 5},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Are you a real American in Croats body?'),
          backgroundColor: Colors.teal,
        ),
        body:
        _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
