import 'package:flutter/material.dart';
import 'dart:math';
class ObjectScreen extends StatefulWidget {
  @override
  _ObjectScreenState createState() => _ObjectScreenState();
}
 List _colors = [
    Colors.red,

  ];

class _ObjectScreenState extends State<ObjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return GridTile(
                child: GestureDetector(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/img/DButt.jpg'),
                    
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      
                    ),
                  ],
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
