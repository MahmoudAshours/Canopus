import 'dart:convert';

import 'package:canopus/Services/base_request.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class NasaPowerService extends BasePowerRequest {
  @override
  Future fetchNasaPowerData(String paramaters, String startDate, String endDate,
      LatLng latLng) async {
    final _url =
        'https://power.larc.nasa.gov/api/temporal/daily/point?start=$startDate&end=$endDate&latitude=${latLng.latitude}&longitude=${latLng.longitude}&community=re&parameters=$paramaters&header=true&time-standard=lst';
    final _response = await http.get(Uri.parse(_url));
    return json.decode(_response.body);
  }
}
