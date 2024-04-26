import 'dart:async';

import 'package:automation_appium/home/page_home.dart';
import 'package:automation_appium/login/login_screen.dart';
import 'package:automation_appium/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../onboard/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/Newii_31-01.mp4');
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    Timer(const Duration(seconds: 2), () {
      navigateFromSplash();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),
        ],
      ),
    );
  }

  void navigateFromSplash() async {
    bool isOnboardingComplete = await Preferences.isOnboardingComplete();
    bool isLoggedIn = await Preferences.isLoggedIn();

    if (isOnboardingComplete) {
      if (isLoggedIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    }
  }
}
