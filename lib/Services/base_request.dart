import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BasePowerRequest {
  Future fetchNasaPowerData(
      String paramaters, String startDate, String endDate, LatLng latLng);

  Future fetchClimatologySolarIrradiance(
      String startYear, String endYear, LatLng latLng);
}
