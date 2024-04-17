import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/const.dart';

class WeaService {
  Future<WeatherMode> getweather(String cityName) async {
    final response = await http
        .get(Uri.parse('$basekey?q=$cityName&appid=$apikey&units=metric'));
    if (response.statusCode == 200) {
      return WeatherMode.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String?> getcurrentcity() async {
    //get permission from the user
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    // get or fetch current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // convert the location into a list of placemark objects
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // extract the city name from the first placemark
    String? city = placemark[0].locality;
    return city ?? '';
  }
}
