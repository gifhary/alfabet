import 'package:flutter/material.dart';

class MainMenu {
  //main menu contains meta data as bellow
  String title, assetPath;

  //widget here is for page that will be opened when the menu is clicked
  Widget widget;

  MainMenu({this.title, this.assetPath, this.widget});
}
