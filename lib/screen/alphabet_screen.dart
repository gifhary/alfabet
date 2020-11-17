import 'dart:math';

import 'package:alfabet/constructor/object_class.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class AlphabetScreen extends StatefulWidget {
  @override
  _AlphabetScreenState createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  static AudioCache _cache = AudioCache();

  List<ObjectClass> _alphabet = [];
  List _colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.blue,
    Colors.purple,
    Colors.cyan,
    Colors.pink,
    Colors.orange,
  ];

  @override
  void initState() {
    for (int i = 0; i < 26; i++) {
      _alphabet.add(ObjectClass(
          name: String.fromCharCode(97 + i),
          audioAssetPath: "",
          imageAssetPath: ""));
    }

    super.initState();
  }

  Future<void> _playVoiceOver(String name) async {
    //await _cache.play('asset/audio/$name.wav');
    await _cache.play('audio/g.wav');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset("assets/img/alphabet_background.gif",
                    fit: BoxFit.fill)),
            Center(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: _alphabet.length,
                itemBuilder: (context, index) {
                  return GridTile(
                      child: GestureDetector(
                    onTap: () => _playVoiceOver(_alphabet[index].name),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ShaderMask(
                            child: Image.asset("assets/img/balloon.png"),
                            shaderCallback: (bounds) {
                              Random random = new Random();

                              return LinearGradient(
                                colors: [
                                  Colors.blue,
                                  _colors[random.nextInt(_colors.length)]
                                ],
                                stops: [0.0, 0.0],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.srcATop,
                          ),
                          Image.asset("assets/img/balloon_fx.png"),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(_alphabet[index].name),
                          ),
                        ],
                      ),
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
