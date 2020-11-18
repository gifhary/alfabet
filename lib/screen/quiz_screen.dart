import 'dart:async';

import 'package:spring_button/spring_button.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Timer timer;

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/img/DButt.jpg"),
            ),
            Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                  width:  MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SpringButton(
                          SpringButtonType.OnlyScale,
                          column(
                            "Increment",
                            Colors.deepPurpleAccent,
                          ),
                          onTapDown: (_) => print("test"),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7,
                  width:  MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SpringButton(
                          SpringButtonType.OnlyScale,
                          column(
                            "Increment",
                            Colors.deepPurpleAccent,
                          ),
                          onTapDown: (_) => print("test"),
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
    );
  }
}
