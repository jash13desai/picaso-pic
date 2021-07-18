import 'package:flutter/material.dart';
import 'package:insta_ui_only/screens/intro_screen.dart';
import 'package:insta_ui_only/theme.dart';
// import 'package:insta_ui_only/widgets/post_widget.dart';

void main() => runApp(Insta());

class Insta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: Intro(),
    );
  }
}
// calender screen;