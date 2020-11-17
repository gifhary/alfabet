import 'package:alfabet/constructor/main_menu.dart';
import 'package:alfabet/screen/alphabet.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MainMenu> _mainMenu = [];

  @override
  void initState() {
    //main menu list is here mutha fukka
    _mainMenu = [
      //menu 0
      MainMenu(
          title: "Alfabet",
          assetPath: "asset/img/DButt.jpg",
          widget: AlphabetScreen()),
      //menu 1
      MainMenu(
        title: "Objek",
        assetPath: "asset/img/DButt.jpg",
        widget: null,
      ),
      MainMenu(
        title: "Kuis",
        assetPath: "asset/img/DButt.jpg",
        widget: null,
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
        Container(
            height: MediaQuery.of(context).size.height,
            //background image home page
            child:
                Image.asset("asset/img/home_background.jpg", fit: BoxFit.fill)),

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
    );
  }
}
