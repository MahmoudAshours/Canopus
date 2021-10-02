import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:canopus/Views/computation_panel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parallax_rain/parallax_rain.dart';
import 'package:rive/rive.dart' as rv;

class FetchingScreen extends StatefulWidget {
  const FetchingScreen({Key? key}) : super(key: key);

  @override
  State<FetchingScreen> createState() => _FetchingScreenState();
}

class _FetchingScreenState extends State<FetchingScreen> {
  @override
  void initState() {
    _fetchingData().then((value) => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ComputationPanel(value: value)),
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff100414),
      body: ParallaxRain(
        dropColors: const [
          Colors.white,
          Colors.grey,
          Colors.blue,
          Colors.orange
        ],
        numberOfDrops: 30,
        dropFallSpeed: 2,
        numberOfLayers: 5,
        child: Stack(
          children: [
            const SafeArea(
              child: SizedBox(
                child: rv.RiveAnimation.asset(
                  'assets/images/ship.riv',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 1),
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText('Loading',
                        speed: const Duration(milliseconds: 100),
                        textStyle: const TextStyle(
                            color: Colors.orange, fontSize: 30)),
                    TypewriterAnimatedText('Fetching data...',
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 30)),
                    TypewriterAnimatedText(
                        '"Beep beep boop" means "I love you" in binary code.',
                        textStyle:
                            const TextStyle(color: Colors.blue, fontSize: 30)),
                    TypewriterAnimatedText('Beep beep boop',
                        textStyle:
                            const TextStyle(color: Colors.pink, fontSize: 30)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _fetchingData() async {
    var resp = await http.get(Uri.parse(
        'https://power.larc.nasa.gov/api/temporal/daily/point?start=20201220&end=20210219&latitude=30&longitude=30&community=re&parameters=RH2M%2CT2M_MAX%2CPRECTOTCORR%2CWS10M_MAX&header=true&time-standard=lst'));

    return json.decode(resp.body);
  }
}
