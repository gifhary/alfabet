import 'package:alfabet/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

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
  AudioPlayer advancedPlayer;

  @override
  void initState() {
    loadMusic();
    //animation time splash screen, change as you wish
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    });

    super.initState();
  }

  //Method to load music. PS. Don't put music in any subfolder after assets
  Future loadMusic() async {
    advancedPlayer = await AudioCache().loop("song.mp3");

    SystemChannels.lifecycle.setMessageHandler((msg) {
      if (msg == "AppLifecycleState.paused") {
        print("yes");
        advancedPlayer.pause();
      } else if (msg == "AppLifecycleState.resumed") {
        advancedPlayer.resume();
      }
    });
  }

  @override
  void dispose() {
    advancedPlayer = null;
    advancedPlayer.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //gif image as coded animation substitute
        child: Image.asset(
          //TODO place holder
          'assets/img/parrot.gif',
          height: 45,
        ),
      ),
    );
  }
}
