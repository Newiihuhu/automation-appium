import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  final String assetImage;
  final String text;
  final String title;

  const IntroWidget(this.assetImage, this.title, this.text);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(
            assetImage,
            fit: BoxFit.contain,
          ),
          Center(
            child: Column(
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 80, left: 30, right: 20),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey.shade700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
