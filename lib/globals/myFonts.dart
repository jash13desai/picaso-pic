import 'package:flutter/material.dart';
import './sizeConfig.dart';

class MyFonts {
  static TextStyle get thin => TextStyle(fontWeight: FontWeight.w300);
  static TextStyle get light => TextStyle(fontWeight: FontWeight.w400);
  static TextStyle get medium => TextStyle(fontWeight: FontWeight.w600);
  static TextStyle get extraBold => TextStyle(fontWeight: FontWeight.w900);
  static TextStyle get bold => TextStyle(fontWeight: FontWeight.w700);
}

extension TextStyleHelpers on TextStyle {
  TextStyle setColor(Color color) => copyWith(color: color);
  TextStyle factor(double factor) =>
      copyWith(fontSize: factor * SizeConfig.horizontalBlockSize);
  TextStyle tsFactor(double tsFactor) =>
      copyWith(fontSize: tsFactor * SizeConfig.textScaleFactor);

  TextStyle size(double size) => copyWith(fontSize: size);
  TextStyle letterSpace(double space) => copyWith(letterSpacing: space);
}
