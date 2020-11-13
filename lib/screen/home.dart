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
      MainMenu(
          title: "Alfabet",
          assetPath: "asset/img/DButt.jpg",
          widget: AlphabetScreen()),
      MainMenu(title: "Obyek", assetPath: "asset/img/DButt.jpg")
    ];

    super.initState();
  }

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
              child: Image.asset("asset/img/home_background.jpg",
                  fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.all(30),
            child: ListView.builder(
                itemCount: _mainMenu.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _openPage(_mainMenu[index].widget),
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
        ],
      )),
    );
  }
}
