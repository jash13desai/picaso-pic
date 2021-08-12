import 'package:flutter/material.dart';

// generalised sizedBox to use at various places!

class MySpaces {
  //vertical gaps
  static const Widget vSmallestGapInBetween = SizedBox(height: 6);
  static const Widget vGapInBetween = SizedBox(height: 20);

  //horizontal gaps
  static const Widget hGapInBetween = SizedBox(width: 12);
  static const Widget hSmallGapInBetween = SizedBox(width: 20);
}
