import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class SolarPanel3D extends StatefulWidget {
  const SolarPanel3D({Key? key}) : super(key: key);

  @override
  _SolarPanelState createState() => _SolarPanelState();
}

class _SolarPanelState extends State<SolarPanel3D>
    with SingleTickerProviderStateMixin {
  late Scene _scene;
  Object? _panel;
  late AnimationController _controller;

  void _onSceneCreated(Scene scene) {
    _scene = scene;
    _scene.camera.position.z = 2;
    _panel = Object(
        backfaceCulling: false,
        mesh: Mesh(texturePath: 'assets/images/solar_panel/panel.jpg'),
        fileName: 'assets/images/solar_panel/objSolar.obj');
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
