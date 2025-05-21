import 'package:flutter/material.dart';

class MediaQueryHelper {
  final BuildContext context;
  late double screenWidth;
  late double screenHeight;
  late double textScaleFactor;

  MediaQueryHelper(this.context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    textScaleFactor = mediaQuery.textScaler.scale(1.00);
  }

  double wp(double percent) => screenWidth * percent / 100;
  double hp(double percent) => screenHeight * percent / 100;

  //Example: font size scaled by text scale factor

  double sp(double fontSize) => fontSize * textScaleFactor;
}
