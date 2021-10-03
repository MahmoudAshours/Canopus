import 'package:canopus/Views/humidity_screen.dart';
import 'package:canopus/Views/temprature_screen.dart';
import 'package:canopus/Views/wind_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComputationPanel extends StatefulWidget {
  final value;
  const ComputationPanel({Key? key, this.value}) : super(key: key);

  @override
  State<ComputationPanel> createState() => _ComputationPanelState();
}

class _ComputationPanelState extends State<ComputationPanel> {
  var _currentIndex = 0;
  final List<Widget> _screens = [];
  final List<BottomNavigationBarItem> _bottomNavBar = [];
  @override
  void initState() {
    try {
      if (widget.value['properties']['parameter']['T2M_MAX'] != null) {
        _screens.add(TempratureScreen(value: widget.value));
        _bottomNavBar.add(const BottomNavigationBarItem(
            icon:
                FaIcon(FontAwesomeIcons.temperatureHigh, color: Colors.orange),
            label: 'Temprature'));
      }
      if (widget.value['properties']['parameter']['RH2M'] != null) {
        _screens.add(HumidityScreen(value: widget.value));
        _bottomNavBar.add(const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.hSquare, color: Colors.orange),
            label: 'Humidity'));
      }
      if (widget.value['properties']['parameter']['WS10M_MAX'] != null) {
        _screens.add(WindScreen(value: widget.value));
        _bottomNavBar.add(const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.wind, color: Colors.orange),
            label: 'Wind'));
      }
      // ignore: empty_catches
    } catch (e) {}
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
          backgroundColor: const Color(0xff100414),
          onTap: (index) => setState(() => _currentIndex = index),
          items: _bottomNavBar,
        ),
        backgroundColor: const Color(0xff100414),
        body: _screens[_currentIndex]);
  }
}
