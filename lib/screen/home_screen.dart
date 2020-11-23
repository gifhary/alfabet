import 'package:alfabet/constructor/main_menu.dart';
import 'package:alfabet/screen/alphabet_screen.dart';
import 'package:alfabet/screen/object_screen.dart';
import 'package:alfabet/screen/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MainMenu> _mainMenu = [];

  static AudioCache cache = AudioCache();
  AudioPlayer advancedPlayer;

  @override
  void initState() {
    loadMusic();

    //main menu list is here mutha fukka
    _mainMenu = [
      //menu 0
      MainMenu(
          title: "Alfabet",
          assetPath: "assets/img/DButt.jpg",
          widget: AlphabetScreen()),
      //menu 1
      MainMenu(
        title: "Objek",
        assetPath: "assets/img/DButt.jpg",
        widget: ObjectScreen(),
      ),
      MainMenu(
        title: "Kuis",
        assetPath: "assets/img/DButt.jpg",
        widget: QuizScreen(),
      )
      //add more menu as you wish
    ];

    super.initState();
  }

//open the widget page contained in the menu
  void _openPage(Widget widget) {
    if (widget != null) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => widget));
    } else {
      print("sumtin goin wong: _openPage function parameter is null");
    }
  }

  //Method to load music. PS. Don't put music in any subfolder after assets
  Future loadMusic() async {
    advancedPlayer = await cache.loop("song.mp3");
    advancedPlayer.setVolume(0.07);

    // ignore: missing_return
    SystemChannels.lifecycle.setMessageHandler((msg) {
      print(msg);
      if (msg == "AppLifecycleState.paused") {
        print("yes");
        advancedPlayer.pause();
      } else if (msg == "AppLifecycleState.resumed") {
        advancedPlayer.resume();
      } else if (msg == "AppLifecycleState.detached") {
        advancedPlayer.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          advancedPlayer.stop();
          advancedPlayer.dispose();
          return Future.value(true);
        },
        child: Scaffold(
            body: Stack(children: [
          Container(
              height: MediaQuery.of(context).size.height,
              //background image home page
              child: Image.asset("assets/img/home_background.jpg",
                  fit: BoxFit.fill)),

          //Menu list view
          Padding(
            padding: const EdgeInsets.all(30),
            child: ListView.builder(
                itemCount: _mainMenu.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    //function on tap each menu
                    onTap: () => _openPage(_mainMenu[index].widget),

                    //menu content e.g image in menu
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(_mainMenu[index].assetPath,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ])),
      ),
    );
  }
}
