import 'dart:async';

import 'package:automation_appium/login/login_screen.dart';
import 'package:automation_appium/utils/preferences.dart';
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

  void navigateFromSplash() async {
    bool isOnboardingComplete = await Preferences.isOnboardingComplete();
    if (isOnboardingComplete) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    }
 }
}
