import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ObjectScreenBenda extends StatefulWidget {
  @override
  _ObjectScreenBendaState createState() => _ObjectScreenBendaState();
}

class _ObjectScreenBendaState extends State<ObjectScreenBenda> {
  List <String> Benda = [
    'Angklung', 'Buku', 'Cermin', 'Dadu', 
    'Ember', 'Foto', 'Gelas', 'Handuk', 
    'Ijazah', 'Jam', 'Kursi', 'Lemari', 
    'Meja', 'Naskah', 'ORBA', 'Piring', 
    'Quran', 'Rak', 'Sarung', 'Toples', 
    'Uang', 'Varkas', 'Wajan', 'XNXX', 
    'Yoyo', 'ZZZZZZ'];
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new ListView.builder(
            reverse: false,
            itemBuilder: (_,int index)=>EachList(this.Benda[index]),
            itemCount: this.Benda.length,
        ),
      ),
    );
  }
}
class EachList extends StatelessWidget{
  final String benda;
  EachList(this.benda);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(child: new Text(benda[0]),),
            new Padding(padding: EdgeInsets.only(right: 10.0)),
            new Text(benda,style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

}