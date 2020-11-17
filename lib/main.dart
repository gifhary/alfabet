import 'package:alfabet/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Main());

//this where the material app start
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyApp());
  }
}

//this is the splash screen widget screen
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    //animation time splash screen, change as you wish
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //gif image as coded animation substitute
        child: Image.asset(
          //TODO place holder
          'asset/img/parrot.gif',
          height: 45,
        ),
      ),
    );
  }
}
