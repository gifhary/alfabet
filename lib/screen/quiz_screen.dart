import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';
import 'package:alfabet/constructor/questions.dart';
import 'package:spring_button/spring_button.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  static AudioCache _cache = AudioCache();
  Timer timer;
  Questions quizquestions = new Questions();
  var randomizer = new Random();
  var randQuestion;
  var randPosition;
  String correctAnswer, wrongAnswer, pic;

  @override
  void initState() {
    super.initState();
    randQuestion = randomizer.nextInt(3);
    randPosition = randomizer.nextInt(2);
    pic = quizquestions.quiz[randQuestion].pic;
    correctAnswer = quizquestions.quiz[randQuestion].correct;
    wrongAnswer = quizquestions.quiz[randQuestion].wrong;
    print(randQuestion);
    print(randPosition);
  }

  Widget column(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(12.5),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: Text('Apa kamu sudah selesai bermain?'),
                  actions: <Widget>[
                    RaisedButton(
                        child: Text('YA!'),
                        onPressed: () => Navigator.of(context).pop(true)),
                    RaisedButton(
                        child: Text('BELUM!'),
                        onPressed: () => Navigator.of(context).pop(false)),
                  ])),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/img/" +
                        quizquestions.quiz[randQuestion].pic +
                        ".jpg",
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 3,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SpringButton(
                            SpringButtonType.OnlyScale,
                            column(
                              randPosition == 0
                                  ? correctAnswer.toString()
                                  : wrongAnswer.toString(),
                              Colors.deepPurpleAccent,
                            ),
                            onTapDown: (_) => randPosition == 0
                                ? checkAnswer(correctAnswer)
                                : checkAnswer(wrongAnswer),
                            onLongPress: () => timer = Timer.periodic(
                              const Duration(milliseconds: 100),
                              (_) => print(""),
                            ),
                            onLongPressEnd: (_) {
                              timer?.cancel();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SpringButton(
                            SpringButtonType.OnlyScale,
                            column(
                              randPosition == 0
                                  ? wrongAnswer.toString()
                                  : correctAnswer.toString(),
                              Colors.deepPurpleAccent,
                            ),
                            onTapDown: (_) => randPosition == 0
                                ? checkAnswer(wrongAnswer)
                                : checkAnswer(correctAnswer),
                            onLongPress: () => timer = Timer.periodic(
                              const Duration(milliseconds: 100),
                              (_) => print("test"),
                            ),
                            onLongPressEnd: (_) {
                              timer?.cancel();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkAnswer(String answer) {
    print(answer);
    if (answer == pic) {
      print("benar");
      _cache.play("audio/benar.mp3");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => QuizScreen()));
    } else {
      print("salah");
      _cache.play("audio/salah.mp3");
    }
  }
}
