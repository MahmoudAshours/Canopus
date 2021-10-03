import 'package:canopus/Provider/maps_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController mapController;
  BitmapDescriptor? _markerIcon;
  double _animatedContainerHeight = 0;
  final TextEditingController _latitudeController = TextEditingController();

  final TextEditingController _longitudeController = TextEditingController();
  void _onMapCreated(GoogleMapController controller) =>
      mapController = controller;

  Marker _createMarker(MapsProvider provider) {
    if (_markerIcon != null) {
      return Marker(
          markerId: const MarkerId("marker_1"),
          position: provider.getLatLng,
          draggable: true);
    } else {
      return Marker(
          markerId: const MarkerId("marker_1"),
          position: provider.getLatLng,
          draggable: true);
    }
  }

  Future<void> _askForLocationPermession() async =>
      await Permission.location.request();

  @override
  void initState() {
    _askForLocationPermession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _mapsProvider = Provider.of<MapsProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          child: const FaIcon(FontAwesomeIcons.mapSigns),
          onPressed: () => setState(() => _animatedContainerHeight == 0
              ? _animatedContainerHeight = 200
              : _animatedContainerHeight = 0)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: Stack(
        children: [
          GoogleMap(
            mapToolbarEnabled: true,
            mapType: MapType.hybrid,
            onTap: (latlng) => _mapsProvider.latLng = latlng,
            indoorViewEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            buildingsEnabled: true,
            onMapCreated: _onMapCreated,
            markers: <Marker>{_createMarker(_mapsProvider)},
            initialCameraPosition:
                CameraPosition(target: _mapsProvider.getLatLng, zoom: 11.0),
          ),
          AnimatedContainer(
            decoration: BoxDecoration(
              color: const Color(0xff100414),
              borderRadius: BorderRadius.circular(30),
            ),
            duration: const Duration(milliseconds: 500),
            width: MediaQuery.of(context).size.width,
            height: _animatedContainerHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Expanded(
                    child: SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Latitude',
                                style: TextStyle(color: Colors.white)),
                          ),
                          TextField(
                            controller: _latitudeController,
                            style: const TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                fillColor: Colors.red,
                                hintText: 'Latitude',
                                hintStyle: TextStyle(
                                    color: Colors.white, fontFamily: 'arial')),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Longitude',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TextField(
                          controller: _longitudeController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(),
                              fillColor: Colors.red,
                              hintText: 'Longitude',
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: 'arial')),
                        ),
                      ],
                    ),
                  )
                ]),
                ElevatedButton(
                  onPressed: () {
                    _mapsProvider.latLng = LatLng(
                        double.tryParse(_latitudeController.text)!,
                        double.tryParse(_longitudeController.text)!);
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            target: LatLng(_mapsProvider.getLatLng.latitude,
                                _mapsProvider.getLatLng.longitude),
                            zoom: 17.0),
                      ),
                    );
                  },
                  child: const Text('View on map'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
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
}
