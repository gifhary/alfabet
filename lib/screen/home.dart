import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Padding(
            padding: const EdgeInsets.all(30),
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("asset/img/DButt.jpg",
                            fit: BoxFit.cover),
                      ),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
