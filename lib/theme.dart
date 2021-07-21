import 'package:insta_ui_only/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'myColors.dart';

// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarThemeLight,
    // iconTheme: IconThemeData(color: kContentColorLightTheme),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    // .apply(bodyColor: kContentColorLightTheme),
    // colorScheme: ColorScheme.light(
    // primary: kPrimaryColor,
    // secondary: kSecondaryColor,
    // error: kErrorColor,
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // By default flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: appBarThemeDark,
    iconTheme: IconThemeData(color: kContentColorDarkTheme),
    //   textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //       .apply(bodyColor: kContentColorDarkTheme),
    //   colorScheme: ColorScheme.dark().copyWith(
    //     primary: kPrimaryColor,
    //     secondary: kSecondaryColor,
    //     error: kErrorColor,
    // ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kBlack,
      //     selectedItemColor: Colors.white70,
      //     unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      //     selectedIconTheme: IconThemeData(color: kPrimaryColor),
      //     showUnselectedLabels: true,
    ),
    snackBarTheme: SnackBarThemeData(
      // backgroundColor: kBlack,
      actionTextColor: kWhite,
    ),
  );
}

final appBarThemeDark = AppBarTheme(
  centerTitle: true,
  elevation: 1,
  backgroundColor: Colors.black,
  actionsIconTheme: IconThemeData(color: kWhite),
);
final appBarThemeLight = AppBarTheme(
  centerTitle: true,
  elevation: 1,
  backgroundColor: Colors.white,
  actionsIconTheme: IconThemeData(color: kBlack),
);
