import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ujikom/splashscreen/splash_screen.dart';
import 'package:ujikom/splashscreen/utils/extension.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({Key? key}) : super(key: key);

  @override
  State<SplashLogo> createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> {
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 6300),
        () => Get.to(() => SplashScreen(),
            transition: Transition.cupertino,
            duration: const Duration(seconds: 5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topRight,
          //     end: Alignment.bottomRight,
          //     colors: [
          //   Color.fromARGB(120, 7, 78, 221),
          //   // Color(0xFFFF700B),
          //   Color.fromARGB(235, 8, 58, 221)
          // ])
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(children: [
            // Lottie.asset("assets/lotties/Logo_Task.json",
            //     width: 300, height: 300, fit: BoxFit.cover),
            // TweenImageWidget(

            //   ImagesEntry(3, 7, "assets/images/logo4vm-v2.jfif"),
            //   durationMilliseconds: 5000,
            // ),
            Image.asset(
              'assets/images/logo.png',
              width: 50.0.wp,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 17.0.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              child: AnimatedTextKit(
                animatedTexts: [
                  FlickerAnimatedText('The Movie',
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      speed: Duration(milliseconds: 6000)),
                ],
                isRepeatingAnimation: true,
                totalRepeatCount: 5,
              ),
            ),
            Text('Movie '),
            SizedBox(
              height: 70,
            ),
            SpinKitFadingCircle(
              color: Colors.black,
              size: 60,
            ),
            SizedBox(
              height: 30,
            ),
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 129, 129, 129),
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  FlickerAnimatedText('Loading Application Data..',
                      speed: Duration(milliseconds: 9000)),
                ],
                isRepeatingAnimation: true,
              ),
            ),
            // Opacity(opacity: 0.3, child: Text('Loading Application Data..'))
          ]),
        ],
      ),
    ));
  }
}

// colors: [Color(0xFFFF800B), Color(0xFFCE1010)]


