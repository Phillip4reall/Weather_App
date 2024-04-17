import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherMode? _weather;

  WeatherMode get weathers => _weather!;
  final _weatherservice = WeaService();
  //fetch weathe

  fetchweather() async {
    String? cityName = await _weatherservice.getcurrentcity();
    //get weather
    try {
      final weather = await _weatherservice.getweather(cityName!);
      _weather = weather;
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
