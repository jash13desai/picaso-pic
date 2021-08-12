import 'package:flutter/material.dart';

// light and dark theme for Insta UI -- activates when the theme of the phone is changed -- the theme of the app is synced with the device's theme

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: Colors.pinkAccent,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarThemeLight,
    // iconTheme: IconThemeData(color: kContentColorLightTheme),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    // .apply(bodyColor: kContentColorLightTheme),
    colorScheme: ColorScheme.light(
        //   primary: kPrimaryColor,
        //   secondary: kSecondaryColor,
        //   error: kErrorColor,
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      // selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
      // unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
      // selectedIconTheme: IconThemeData(color: kPrimaryColor),
      // showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.pinkAccent,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: appBarThemeDark,
    // iconTheme: IconThemeData(color: kContentColorDarkTheme),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: Colors.pinkAccent,
      //   secondary: kSecondaryColor,
      //   error: kErrorColor,
      //   onBackground:
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      //     selectedItemColor: Colors.white70,
      //     unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
      //     selectedIconTheme: IconThemeData(color: kPrimaryColor),
      //     showUnselectedLabels: true,
    ),
  );
}

final appBarThemeDark = AppBarTheme(
  centerTitle: true,
  elevation: 1,
  backgroundColor: Colors.black,
  actionsIconTheme: IconThemeData(color: Colors.white),
);
final appBarThemeLight = AppBarTheme(
  centerTitle: true,
  elevation: 1,
  backgroundColor: Colors.white,
  actionsIconTheme: IconThemeData(color: Colors.black),
);
final bottomAppBarThemeLight = BottomNavigationBarThemeData(
  elevation: 1,
  backgroundColor: Colors.white,
);
final bottomAppBarThemeDark = BottomNavigationBarThemeData(
  elevation: 1,
  backgroundColor: Colors.black,
);
