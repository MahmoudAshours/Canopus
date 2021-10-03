import 'dart:math';
import 'package:canopus/Views/irradiance_graph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SolarIrradianceStatsScreen extends StatelessWidget {
  final String value;
  final String name;
  final Map<String, dynamic> keys;
  const SolarIrradianceStatsScreen(
      {Key? key, required this.value, required this.keys, required this.name})
      : super(key: key);

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff262A35),
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      title: const Text(
                        'Average  Solar irradiance',
                        style: TextStyle(color: Colors.orange),
                      ),
                      subtitle: Center(
                        child: Text(
                          '${keys[value].keys.toList().where((String e) => keys[value][e] != -999.0).map((m) => keys[value][m]).reduce((a, b) => roundDouble(a + b / keys[value].keys.toList().length, 2))} kW-hr/m^2/day',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: const Color(0xff262A35),
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      title: const Text(
                        'Maximum  Solar irradiance',
                        style: TextStyle(color: Colors.orange),
                      ),
                      subtitle: Center(
                        child: Text(
                          '${keys[value].keys.toList().where((String e) => keys[value][e] != -999.0).map((m) => keys[value][m]).reduce((a, b) => a > b ? a : b)} \n kW-hr/m^2/day',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff262A35),
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      title: const Text(
                        'Minimum Solar irradiance',
                        style: TextStyle(color: Colors.orange),
                      ),
                      subtitle: Center(
                        child: Text(
                          '${keys[value].keys.toList().where((String e) => keys[value][e] != -999.0).map((m) => keys[value][m]).reduce((a, b) => a < b ? a : b)}\n kW-hr/m^2/day',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 18.0),
                    child: Center(
                      child: Text(
                        'Assuming that Solar panel produces 80 volt with 75% efficiency',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff262A35),
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      title: const Text(
                        'Max Amount of power gained per day',
                        style: TextStyle(color: Colors.orange),
                      ),
                      subtitle: Center(
                        child: Text(
                          '${roundDouble(keys[value].keys.toList().where((String e) => keys[value][e] != -999.0).map((m) => keys[value][m]).reduce((a, b) => a > b ? a : b) * 75 / 100 * 80, 2)} \nW/h/day',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xff262A35),
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      title: const Text(
                        'Minimun Amount of power gained per day',
                        style: TextStyle(color: Colors.orange),
                      ),
                      subtitle: Center(
                        child: Text(
                          '${roundDouble(keys[value].keys.toList().where((String e) => keys[value][e] != -999.0).map((m) => keys[value][m]).reduce((a, b) => a < b ? a : b) * 75 / 100 * 80, 2)} \n W/h/day',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) =>
                      IrradianceGraphScreen(name: name, value: keys[value]),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  fixedSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 30))),
              child: const Text(
                'Check graphs!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
