import 'package:flutter/material.dart';

// mostly used font configurations which are used in ifferent pages!

class MyFonts {
  static TextStyle get thin => TextStyle(fontWeight: FontWeight.w300);
  static TextStyle get light => TextStyle(fontWeight: FontWeight.w400);
  static TextStyle get medium => TextStyle(fontWeight: FontWeight.w600);
  static TextStyle get bold => TextStyle(fontWeight: FontWeight.w700);
}

extension TextStyleHelpers on TextStyle {
  TextStyle setColor(Color color) => copyWith(color: color);
  TextStyle size(double size) => copyWith(fontSize: size);
}
