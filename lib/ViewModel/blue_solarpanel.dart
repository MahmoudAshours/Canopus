import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class BlueSolarPanel extends StatefulWidget {
  const BlueSolarPanel({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<BlueSolarPanel>
    with SingleTickerProviderStateMixin {
  late Scene _scene;
  Object? _panel;
  late AnimationController _controller;

  void _onSceneCreated(Scene scene) {
    _scene = scene;
    _scene.camera.position.z = 2;
    _panel = Object(
        backfaceCulling: false,
        fileName: 'assets/images/solar_panel/solarPanel.obj');
    _scene.world.add(_panel!);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 30000), vsync: this)
      ..addListener(() {
        if (_panel != null) {
          _panel!.rotation.y = _controller.value * 360;
          _panel!.updateTransform();
          _scene.update();
        }
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Cube(onSceneCreated: _onSceneCreated);
}
