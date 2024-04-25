import 'package:automation_appium/utils/preferences.dart';
import 'package:flutter/material.dart';

import '../login/login_screen.dart';
import 'intro_widget.dart';
import '../widgets/dots_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  bool leadingVisibility = false;

  final List<Widget> _pages = [
    const IntroWidget("assets/newii.png", "Newii",
        "View activity collected by your fitness trackers and your other mobile apps! \n \n Data has never been more beautiful or easier to understand!"),
    const IntroWidget("assets/eva.png", "Eva",
        "A new kind of fittness tracking! \n \n 100% free, because great heath should be accessible to all!"),
    const IntroWidget("assets/miwtoo.png", "Miwtoo",
        "Your progress photos are being put to good use! \n \n The photoLAPSE feature allows you to view your result over custom time periods!"),
  ];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentPageIndex == _pages.length - 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: <Widget>[
            pageViewFillWidget(),
            appBarWithButton(isLastPage, context),
            bottomDotsWidget()
          ],
        ),
      ),
    );
  }

  Positioned pageViewFillWidget() {
    return Positioned.fill(
        child: PageView.builder(
      controller: _controller,
      itemCount: _pages.length,
      itemBuilder: (BuildContext context, int index) {
        return _pages[index % _pages.length];
      },
      onPageChanged: (int p) {
        setState(() {
          currentPageIndex = p;
          if (currentPageIndex == 0) {
            leadingVisibility = false;
          } else {
            leadingVisibility = true;
          }
        });
      },
    ));
  }

  Positioned appBarWithButton(bool isLastPage, BuildContext context) {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: SafeArea(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          primary: false,
          centerTitle: true,
          leading: Visibility(
              visible: leadingVisibility,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  _controller.animateToPage(currentPageIndex - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut);
                },
              )),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, right: 12, bottom: 12),
              child: ElevatedButton(
                onPressed: isLastPage
                    ? () async {
                        await Preferences
                            .setOnboardingComplete(); // Save the state
                        // Last Page Done Click
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      }
                    : () {
                        _controller.animateToPage(currentPageIndex + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(97, 6, 165, 1.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)))),
                child: Text(
                  isLastPage ? 'DONE' : 'NEXT',
                  style: const TextStyle(
                      fontFamily: 'Exo2SemiBold',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Positioned bottomDotsWidget() {
    return Positioned(
        bottom: 20,
        left: 0.0,
        right: 0.0,
        child: DotsIndicator(
          controller: _controller,
          itemCount: _pages.length,
          color: const Color.fromRGBO(97, 10, 165, 0.8),
          onPageSelected: (int page) {
            _controller.animateToPage(
              page,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
        ));
  }
}
