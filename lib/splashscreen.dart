import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final font = "RobotoSlab";

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/weather/download.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 5),
                Text(
                  "Weather App",
                  style:
                      TextStyle(fontFamily: font, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText("Your quick weather report",
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: font))
                ])
              ],
            ),
          )),
    );
  }
}
