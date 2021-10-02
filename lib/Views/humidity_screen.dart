import 'package:canopus/Views/graph_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HumidityScreen extends StatelessWidget {
  final value;
  HumidityScreen({Key? key, this.value}) : super(key: key);
  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 18.0),
            child: Text(
              'According to your location : ',
              style: TextStyle(
                  color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: GoogleMap(
              mapToolbarEnabled: false,
              mapType: MapType.terrain,
              indoorViewEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              scrollGesturesEnabled: false,
              zoomGesturesEnabled: false,
              tiltGesturesEnabled: false,
              rotateGesturesEnabled: false,
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 30.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                  color: const Color(0xff262A35),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.ac_unit, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [Color(0xff00AAFF), Color(0xff008BFD)],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Average humidity percentage',
                      style: TextStyle(color: Colors.white, fontFamily: 'asd'),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        '${value['properties']['parameter']['RH2M'].keys.toList().map((m) => value['properties']['parameter']['RH2M'][m]).reduce((a, b) => a + b) / value['properties']['parameter']['RH2M'].keys.toList().length}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color(0xff262A35),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.ac_unit, color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [Color(0xff00AAFF), Color(0xff008BFD)],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Maximum humidity percentage',
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'asd'),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          '${value['properties']['parameter']['RH2M'].keys.toList().map((m) => value['properties']['parameter']['RH2M'][m]).reduce((a, b) => a > b ? a : b)} m/s',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.ac_unit, color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [Color(0xff00AAFF), Color(0xff0F0413)],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Minimum humidity percentage',
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'asd'),
                      ),
                      Center(
                        child: Text(
                          '${value['properties']['parameter']['RH2M'].keys.toList().map((m) => value['properties']['parameter']['RH2M'][m]).reduce((a, b) => a < b ? a : b)} m/s',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => GraphScreen(
                        name: "Humidity percentage",
                        value: value['properties']['parameter']['RH2M'])),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orange),
                fixedSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 30),
                ),
              ),
              child: const Text(
                'Check graphs!',
                style: TextStyle(
                    fontFamily: 'wave',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
