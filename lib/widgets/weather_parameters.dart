import 'package:flutter/material.dart';
import 'package:weather_app/widgets/font.dart';

Widget weather(String text, int num) {
  // ignore: sized_box_for_whitespace
  return Container(
    height: 100,
    width: 110,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              text,
              style: textfont(18, FontWeight.bold, Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$num',
              style: textfont(25, FontWeight.bold, Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}
