import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  late GoogleMapController mapController;

  LatLng _center = const LatLng(45.521563, -122.677433);
  BitmapDescriptor? _markerIcon;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Marker _createMarker() {
    if (_markerIcon != null) {
      return Marker(
        markerId: const MarkerId("marker_1"),
        position: _center,
        icon: _markerIcon!,
      );
    } else {
      return Marker(
        markerId: const MarkerId("marker_1"),
        position: _center,
      );
    }
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: const Size.square(48));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/red_square.png')
          .then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() => _markerIcon = bitmap);
  }

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: GoogleMap(
        mapToolbarEnabled: true,
        mapType: MapType.hybrid,
        onTap: (latlng) => setState(() => _center = latlng),
        indoorViewEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        markers: <Marker>{_createMarker()},
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      ),
    );
  }
}
