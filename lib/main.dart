import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Provider/weather_provider.dart';

import 'package:weather_app/views/welcomepage.dart';

//import 'views/weather_page.dart';
//import 'package:weather_app/views/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => WeatherProvider())],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            //home: WeatherPage()));
            home: Welcome()));
  }
}
