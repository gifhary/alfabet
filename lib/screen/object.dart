import 'package:flutter/material.dart';

class ObjectScreen extends StatefulWidget {
  @override
  _ObjectScreenState createState() => _ObjectScreenState();
}

class _ObjectScreenState extends State<ObjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(1.5),
          crossAxisCount: 2,
          childAspectRatio: 1.7,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          shrinkWrap: true,
          children: List.generate(4, (index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: Colors.pink,
                      elevation: 1,
                      child: InkWell(
                        onTap: (null),
                       child: Padding(padding: const EdgeInsets.all(1.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget> [
                           Text('Kontol')
                         ],

                       ))
                      ),
                    ),
                  ),
                ]);
          }),
        ),
      ),
    );
  }
}
