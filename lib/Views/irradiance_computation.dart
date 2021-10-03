import 'package:canopus/Views/solar_irradiance_stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SolarIrradianceComputation extends StatefulWidget {
  final value;
  const SolarIrradianceComputation({Key? key, this.value}) : super(key: key);

  @override
  State<SolarIrradianceComputation> createState() =>
      _SolarIrradianceComputationState();
}

class _SolarIrradianceComputationState
    extends State<SolarIrradianceComputation> {
  var _currentIndex = 0;
  late List<Widget> _screens;
  var isLoading = true;
  final _bottomNavigationBar = const [
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.gripHorizontal)),
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.minusCircle)),
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.thList)),
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.plusCircle)),
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.gripVertical)),
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.rulerCombined)),
    BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.angleDoubleDown)),
  ];

  final List<String> _fullnames = const [
    'Solar Irradiance for Equator Facing Horizontal Surface',
    'Solar Irradiance for Equator Facing Latitude Minus 15 Tilt',
    'Solar Irradiance for Equator Facing Latitude Tilt',
    "Solar Irradiance for Equator Facing Latitude Plus 15 Tilt",
    "Solar Irradiance for Equator Facing Vertical Surface",
    "Solar Irradiance Optimal",
    "Solar Irradiance Optimal Angle",
  ];
  @override
  void initState() {
    _screens = [];
    int i = 0;
    widget.value['properties']['parameter'].keys.forEach(
      (e) {
        setState(
          () => _screens.add(
            SolarIrradianceStatsScreen(
              value: e,
              name: _fullnames[i],
              keys: widget.value['properties']['parameter'],
            ),
          ),
        );
        if (i < 6) i++;
      },
    );
    setState(() => isLoading = false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: const Color(0xff100414)),
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.indicator,
          snakeViewColor: Colors.orange,
          unselectedItemColor: Colors.blueGrey,
          showSelectedLabels: true,
          currentIndex: _currentIndex,
          items: _bottomNavigationBar,
          backgroundColor: const Color(0xff100414),
          onTap: (index) => setState(() => _currentIndex = index),
        ),
        backgroundColor: const Color(0xff100414),
        body: isLoading
            ? const CircularProgressIndicator()
            : _screens[_currentIndex]);
  }
}
