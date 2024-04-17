class WeatherMode {
  String cityname;
  double temperature;
  String weathercondition;
  int? humidity;
  double tempMin;
  double tempMax;
  int? pressure;

  WeatherMode({
    this.humidity,
    required this.tempMax,
    required this.tempMin,
    this.pressure,
    required this.weathercondition,
    required this.cityname,
    required this.temperature,
  });

  factory WeatherMode.fromJson(Map<String, dynamic> json) {
    return WeatherMode(
        weathercondition: json['weather'][0]['main'] ?? '',
        cityname: json['name'] ?? '',
        temperature: json['main']['temp'].toDouble() ?? '',
        humidity: json['main']['humidity'] ?? "",
        tempMax: json['main']['temp_max'].toDouble() ?? '',
        tempMin: json['main']['temp_min'].toDouble() ?? '',
        pressure: json['main']['pressure'] ?? '');
  }
}
