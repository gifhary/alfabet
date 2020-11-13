import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset("asset/img/home_background.jpg",
                  fit: BoxFit.fill)),
          ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Image.asset("asset/img/DButt.jpg", fit: BoxFit.cover),
                    ),
                  ),
                );
              }),
        ],
      )),
    );
  }
}
