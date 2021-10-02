import 'package:canopus/ViewModel/solarpanel_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SolarPanelScreen extends StatefulWidget {
  SolarPanelScreen({Key? key}) : super(key: key);

  @override
  State<SolarPanelScreen> createState() => _SolarPanelScreenState();
}

class _SolarPanelScreenState extends State<SolarPanelScreen> {
  double width = 0;
  int numberPressed = 1;
  final List<String> _words = [
    'The average solar panel is able to produce might be anywhere between 250 watts and 370 watts.',
    "Standard Test Conditions for solar panel wattage would mean your solar panel is operating at 77 degrees Fahrenheit while there are 1000 watts of sunlight per square meter.",
    "So, under these ideal conditions, a 250-watt solar panel will produce 250 watts of electricity.",
  ];
  final List<String> _efficiency = [
    'Efficiency tells you how much sunlight your solar panel is capable of converting into electricity',
    "For example, if your solar panel has an efficiency rating of 13 percent, that means that 13 percent of the sunlight striking your solar panel will be transformed into the power you need to toast bread or do a load of laundry.",
    "So, under these ideal conditions, a 250-watt solar panel will produce 250 watts of electricity.",
  ];
  final List<String> _cleaning = [
    "Solar panels get dirty. That’s just what happens when a thing is outside all day, everyday.",
    " The first thing to keep in mind is that there is no one “correct” way to clean your solar panels. There are many different types of solar panels and they all differ slightly from one another.",
    "Manageable situations are when the weather conditions are short, when rain or snow runoff takes care of the cleaning naturally",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => setState(() => width = 0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/solar-panels.jpeg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              numberPressed = 1;
              width != 0
                  ? width = 0
                  : width = MediaQuery.of(context).size.width / 1.3;
            }),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                child: Center(child: Text('1')),
                backgroundColor: Colors.orange,
                radius: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: GestureDetector(
              onTap: () => setState(
                () {
                  numberPressed = 2;
                  width != 0
                      ? width = 0
                      : width = MediaQuery.of(context).size.width / 1.3;
                },
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  child: Center(child: Text('2')),
                  backgroundColor: Colors.pink,
                  radius: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: GestureDetector(
              onTap: () => setState(() {
                numberPressed = 3;
                width != 0
                    ? width = 0
                    : width = MediaQuery.of(context).size.width / 1.3;
              }),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  child: Center(child: Text('3')),
                  backgroundColor: Colors.brown,
                  radius: 20,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: const Color(0xff100414),
                borderRadius: BorderRadius.circular(30),
              ),
              duration: const Duration(milliseconds: 500),
              width: width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: const SolarPanel3D(),
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.height / 3,
                  ),
                  const Text('Solar panel',
                      style: TextStyle(color: Colors.red)),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: ListView(
                      padding: const EdgeInsets.only(bottom: 10),
                      children: solarPanelInformation(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child:
                      FaIcon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> solarPanelInformation() {
    if (numberPressed == 1) {
      return _words
          .map(
            (solarInfo) => ListTile(
              tileColor: Colors.red,
              title: Text(
                solarInfo,
                style:
                    const TextStyle(color: Colors.white, fontFamily: 'arial'),
              ),
            ),
          )
          .toList();
    } else if (numberPressed == 2) {
      return _efficiency
          .map(
            (solarInfo) => ListTile(
              tileColor: Colors.red,
              title: Text(
                solarInfo,
                style:
                    const TextStyle(color: Colors.white, fontFamily: 'arial'),
              ),
            ),
          )
          .toList();
    }
    return _cleaning
        .map(
          (solarInfo) => ListTile(
            tileColor: Colors.red,
            title: Text(
              solarInfo,
              style: const TextStyle(color: Colors.white, fontFamily: 'arial'),
            ),
          ),
        )
        .toList();
  }
}
