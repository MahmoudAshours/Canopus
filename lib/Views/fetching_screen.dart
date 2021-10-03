import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:canopus/Services/nasa_power_service.dart';
import 'package:canopus/Views/computation_panel.dart';
import 'package:canopus/Views/irradiance_computation.dart';
import 'package:flutter/material.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:canopus/Provider/arguments_provider.dart';
import 'package:canopus/Provider/date_provider.dart';
import 'package:canopus/Provider/maps_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart' as rv;

class FetchingScreen extends StatefulWidget {
  final bool isSolarIrradiance;
  const FetchingScreen({Key? key, this.isSolarIrradiance = false})
      : super(key: key);

  @override
  State<FetchingScreen> createState() => _FetchingScreenState();
}

class _FetchingScreenState extends State<FetchingScreen> {
  @override
  void didChangeDependencies() {
    final _argumentsProvider = Provider.of<ArgumentsProvider>(context);
    final _dateProvider = Provider.of<DateProvider>(context);
    final _mapsProvider = Provider.of<MapsProvider>(context);

    widget.isSolarIrradiance
        ? NasaPowerService()
            .fetchClimatologySolarIrradiance(
                _dateProvider.getStartDate.replaceAll('/', ''),
                _dateProvider.getEndDate.replaceAll('/', ''),
                _mapsProvider.getLatLng)
            .then(
              (value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (_) => SolarIrradianceComputation(value: value)),
              ),
            )
        : NasaPowerService()
            .fetchNasaPowerData(
                _argumentsProvider.getArguments.toList().join(','),
                _dateProvider.getStartDate.replaceAll('/', ''),
                _dateProvider.getEndDate.replaceAll('/', ''),
                _mapsProvider.getLatLng)
            .then(
              (value) => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (_) => ComputationPanel(value: value)),
              ),
            );
    super.didChangeDependencies();
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
}
