import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = SizeConfig() as MediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double horizontalBlockSize = 0;
  static double verticalBlockSize = 0;
  static double textScaleFactor = 0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    textScaleFactor = _mediaQueryData.textScaleFactor;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    horizontalBlockSize = screenWidth / 100;
    verticalBlockSize = screenHeight / 100;
  }
}
