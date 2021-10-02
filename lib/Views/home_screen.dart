import 'dart:math';
import 'package:canopus/Constants/quotes.dart';
import 'package:canopus/ViewModel/earth_widget.dart';
import 'package:canopus/Views/earth_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rand = Random().nextInt(SunQuotes.famousQuotes.length);
    return Scaffold( 
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => const EarthDetail(),
                    fullscreenDialog: true,
                    maintainState: false)),
            child: const Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                child: RotatingEarth(),
              ),
            ),
          ),
          const SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Text(
                    'Canopus',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 50,
                        fontFamily: 'awake'),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    text: '${SunQuotes.famousQuotes[rand]['quote']}',
                    style: const TextStyle(fontFamily: 'wave', fontSize: 23),
                    children: [
                      TextSpan(
                          text: '\n${SunQuotes.famousQuotes[rand]['by']}',
                          style: const TextStyle(
                              color: Colors.orange,
                              fontFamily: 'age',
                              fontSize: 20))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
