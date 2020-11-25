import 'package:alfabet/screen/object_screen_content/object_screen_benda.dart';
import 'package:alfabet/screen/object_screen_content/object_screen_hewan.dart';
import 'package:alfabet/screen/object_screen_content/object_screen_kendaraan.dart';
import 'package:alfabet/screen/object_screen_content/object_screen_profesi.dart';
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
  Widget kendaraan() {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ObjectScreenKendaraan();
          }));
        },
        child: Container(
      child: Column(
        children: [Image.asset('assets/img/DButt.jpg'), Text("Kendaraan")],
      ),
    ));
  }

  Widget profesi() {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ObjectScreenProfesi();
          }));
        },
        child: Container(
      child: Column(
        children: [Image.asset('assets/img/DButt.jpg'), Text("profesi")],
      ),
    ));
  }

  Widget benda() {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ObjectScreenBenda();
          }));
        },
        child: Container(
      child: Column(
        children: [Image.asset('assets/img/DButt.jpg'), Text("benda")],
      ),
    ));
  }

  Widget hewan() {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ObjectScreenHewan();
          }));
        },
        child: Container(
          child: Column(
            children: [Image.asset('assets/img/DButt.jpg'), Text("Hewan")],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            children: <Widget>[
              kendaraan(),
              profesi(),
              hewan(),
              benda(),
            ]),
      ),
    );
  }
}
