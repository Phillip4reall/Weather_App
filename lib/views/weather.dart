import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/widgets/font.dart';
import 'package:weather_app/widgets/weather_parameters.dart';

import '../Provider/weather_provider.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  //final _weatherservice = WeaService();
  // ignore: unused_field
  // WeatherMode? _weather;

  //fetch weather
  //fetchweather() async {
  // String? cityName = await _weatherservice.getcurrentcity();
  //get weather
  // try {
  //  final weather = await _weatherservice.getweather(cityName!);
  // setState(() {
  //   _weather = weather;
  //  });
  //  } catch (e) {
  // ignore: avoid_print
  //  print(e);
  //}
  // }

//  @override
  //void initState() {
  //  super.initState();
  // fetchweather();
  // }

  //weather animation
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<WeatherProvider>(context, listen: false).fetchweather();
    });
    super.initState();
  }

  DateTime nows = DateTime.now();
  // String covertedtime ="${nows.hour.toString().padLeft(2, '0')}-${nows.minute.toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    String covertedtime =
        "${nows.hour.toString().padLeft(2, '0')}:${nows.minute.toString().padLeft(2, '0')}";
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
        backgroundColor: Colors.grey.shade400,
        centerTitle: true,
        title: Text(
          'Lagos,Nigeria',
          style: textfont(18, FontWeight.bold, Colors.black),
        ),
      ),
      body: Consumer<WeatherProvider>(builder: (_, snapshot, __) {
        return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.weathers.cityname,
                        style: textfont(20, FontWeight.bold, Colors.black),
                      ),
                      Row(
                        children: [
                          Lottie.asset('assets/sunny.json',
                              height: 50, width: 50),
                          Text(
                            snapshot.weathers.weathercondition,
                            style: textfont(15, FontWeight.bold, Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      '${snapshot.weathers.temperature.round()}°C',
                      style: textfont(55, FontWeight.bold, Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateTime.now().toString().substring(0, 10),
                        style: textfont(20, FontWeight.bold, Colors.black),
                      ),
                      Row(
                        children: [
                          Text(
                            '${snapshot.weathers.tempMax.round()}',
                            style: textfont(15, FontWeight.bold, Colors.black),
                          ),
                          Text(
                            '-',
                            style: textfont(25, FontWeight.bold, Colors.black),
                          ),
                          Text(
                            '${snapshot.weathers.tempMax.round()}',
                            style: textfont(15, FontWeight.bold, Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                weather('Real Feel', 35),
                                weather(
                                    'Humidity', snapshot.weathers.humidity!),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                weather(
                                    'Pressure', snapshot.weathers.pressure!),
                                weather('Max-temp',
                                    snapshot.weathers.tempMax.round()),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                weather('Min-temp',
                                    snapshot.weathers.tempMin.round()),
                                weather('Time', int.parse(covertedtime)),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ));
      }),
    );
  }
}
