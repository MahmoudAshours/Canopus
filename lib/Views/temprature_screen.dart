import 'dart:math';

import 'package:canopus/Provider/maps_provider.dart';
import 'package:canopus/Views/graph_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class TempratureScreen extends StatelessWidget {
  final value;
  TempratureScreen({Key? key, this.value}) : super(key: key);

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    final _mapsProvider = Provider.of<MapsProvider>(context);
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 18.0),
            child: Text(
              'According to your location : ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
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
                  CameraPosition(target: _mapsProvider.getLatLng, zoom: 30.0),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Average temprature',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        '${value['properties']['parameter']['T2M_MAX'].keys.toList().map((m) => value['properties']['parameter']['T2M_MAX'][m]).reduce((a, b) => roundDouble(a + b / value['properties']['parameter']['T2M_MAX'].keys.toList().length, 2))} m/s',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Maximum temprature',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          '${value['properties']['parameter']['T2M_MAX'].keys.toList().map((m) => value['properties']['parameter']['T2M_MAX'][m]).reduce((a, b) => a > b ? a : b)} m/s',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color(0xff262A35),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Minimum temprature',
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'asd'),
                      ),
                      Center(
                        child: Text(
                          '${value['properties']['parameter']['T2M_MAX'].keys.toList().map((m) => value['properties']['parameter']['T2M_MAX'][m]).reduce((a, b) => a < b ? a : b)} m/s',
                          style: const TextStyle(
                              fontSize: 26, color: Colors.white),
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
                      name: "temprature",
                      value: value['properties']['parameter']['T2M_MAX']),
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
