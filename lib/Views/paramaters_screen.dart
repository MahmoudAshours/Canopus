import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rv;

class ParamaterScreen extends StatefulWidget {
  const ParamaterScreen({Key? key}) : super(key: key);
  @override
  ParamaterScreenState createState() => ParamaterScreenState();
}

class ParamaterScreenState extends State<ParamaterScreen> {
  static const List<String> _paramaters = [
    "Relative Humidity",
    "Temperature",
    "Solar Irradiance",
    "Wind Speed",
  ];
  final Set<String> _checked = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff100414),
        title: const Text('Paramaters', style: TextStyle(fontSize: 24)),
      ),
      backgroundColor: const Color(0xff100414),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SafeArea(
            child: SizedBox(
              width: 400,
              height: 200,
              child: rv.RiveAnimation.asset(
                'assets/images/robo.riv',
                // controllers: _controllers,
              ),
            ),
          ),
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'awake',
              ),
              child: AnimatedTextKit(
                pause: const Duration(seconds: 1),
                animatedTexts: [
                  TypewriterAnimatedText('Discipline is the best tool',
                      speed: const Duration(milliseconds: 100)),
                  TypewriterAnimatedText('Design first, then code'),
                  TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                  TypewriterAnimatedText(
                      'Do not test bugs out, design them out'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 40,
                childAspectRatio: 2.6,
                children: _paramaters
                    .asMap()
                    .entries
                    .map(
                      (entry) => GestureDetector(
                        onTap: () => _checked.contains(entry.value)
                            ? setState(() => _checked.remove(entry.value))
                            : setState(() => _checked.add(entry.value)),
                        child: Card(
                          shape: const StadiumBorder(),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            color: _checked.contains(entry.value)
                                ? Colors.orange
                                : Colors.white,
                            child: Center(
                              child: Text(
                                entry.value,
                                style: TextStyle(
                                    fontFamily: 'wave',
                                    color: _checked.contains(entry.value)
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff100414), Colors.black],
                ),
              ),
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ],
      ),
    );
  }
}
