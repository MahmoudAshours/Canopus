import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsProvider extends ChangeNotifier {
  LatLng _latLng = const LatLng(45.521563, -122.677433);
  LatLng get getLatLng => _latLng;
  set latLng(LatLng newLatLng) {
    _latLng = newLatLng;
    notifyListeners();
  }
  
}
