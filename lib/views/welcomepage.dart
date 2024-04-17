import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/views/weather.dart';
import 'package:weather_app/widgets/font.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/rain.json', height: 450, width: 350),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Welcome to Weather app',
                style: textfont(20, FontWeight.bold, Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Everything you need to know about weather is only one glance away now!',
                style: textfont(20, FontWeight.normal, Colors.black12),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WeatherPage()));
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 50,
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
