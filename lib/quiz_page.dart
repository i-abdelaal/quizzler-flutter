import 'package:flutter/material.dart';
import 'package:quizzler/score.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'mark.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
Score score = Score();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  bool correctAnswer;

  void checkAnswer(bool userPickedAnswer) {
    if (quizBrain.isQuizEnd()) {
      Alert(
        context: context,
        title: 'YOUR RESULT',
        desc: score.getResult(quizBrain.getQuestionCount()),
      ).show();

      setState(() {
        scoreKeeper = [];
        quizBrain.nextQuestion();
        score.reset();
      });
    } else {
      setState(() {
        correctAnswer = quizBrain.getQuestionAnswer();
        if (correctAnswer == userPickedAnswer) {
          scoreKeeper.add(Mark(
            mark: Icons.check,
            iconColor: Colors.green,
          ));
          score.increment();
        } else {
          scoreKeeper.add(Mark(
            mark: Icons.close,
            iconColor: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () => checkAnswer(true),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () => checkAnswer(false),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
