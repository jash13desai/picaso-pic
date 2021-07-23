import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/screens/intro_screen.dart';
import 'package:insta_ui_only/globals/theme.dart';

import 'screens/account_screen.dart';
import 'screens/activity_screen.dart';
import 'screens/dm_list_screen.dart';
import 'screens/dm_screen.dart';
import 'screens/homeBar_screen.dart';
import 'screens/login_screen.dart';
import 'screens/postList_screen.dart';
import 'screens/search_screen.dart';
import 'screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Insta());
}

class Insta extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      // home: Intro(),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('You have an error! ${snapshot.error.toString()}');
            return Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return IntroPage();
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ),
            );
          }
        },
      ),
      routes: {
        IntroPage.route: (context) => IntroPage(),
        LogIn.route: (ctx) => LogIn(),
        SignUp.route: (ctx) => SignUp(),
        AccountPage.route: (ctx) => AccountPage(),
        ActivityPage.route: (context) => ActivityPage(),
        DMScrollList.route: (ctx) => DMScrollList(),
        DMPage.route: (ctx) => DMPage(),
        InstaHome.route: (ctx) => InstaHome(),
        InstaList.route: (ctx) => InstaList(),
        SearchPage.route: (ctx) => SearchPage(),
      },
    );
  }
}



//renamed the main folder of the project for Week03-Tasks -- just to check whether things go smooth on
// renaming both the project from both the ends! :)

// Edit -- Yupp the renaming worked perfectly even the url works fine :)
