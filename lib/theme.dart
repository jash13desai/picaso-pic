import 'package:insta_ui_only/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'myColors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
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
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: appBarThemeDark,
    // iconTheme: IconThemeData(color: kContentColorDarkTheme),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
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
  actionsIconTheme: IconThemeData(color: kWhite),
);
final appBarThemeLight = AppBarTheme(
  centerTitle: true,
  elevation: 1,
  backgroundColor: Colors.white,
  actionsIconTheme: IconThemeData(color: kBlack),
);
final bottomAppBarThemeLight = BottomNavigationBarThemeData(
  elevation: 1,
  backgroundColor: Colors.white,
);
final bottomAppBarThemeDark = BottomNavigationBarThemeData(
  elevation: 1,
  backgroundColor: Colors.black,
);
