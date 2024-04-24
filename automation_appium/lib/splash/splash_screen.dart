import 'dart:async';

import 'package:flutter/material.dart';

import '../onboard/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      navigateFromSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Newii",
        style: TextStyle(fontSize: 20, fontFamily: "Exo2SemiBold"),
      )),
    );
  }

  void navigateFromSplash() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
  }
}
