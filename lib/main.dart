import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/providers/posts.dart';
import 'package:insta_ui_only/screens/IntroScreen/intro_screen.dart';
import 'package:insta_ui_only/globals/theme.dart';
import 'package:provider/provider.dart';
import 'package:insta_ui_only/providers/authentication.dart';

import 'screens/accountScreen/account_screen.dart';
import 'screens/ActivityScreen/activity_screen.dart';

import 'screens/DMScreen/dm_list_screen.dart';
import 'screens/DMScreen/dm_screen.dart';
import 'screens/AccountScreen/editProfile_screen.dart';
import 'screens/MainPageScreen_Feeds/homeBar_screen.dart';
import 'screens/IntroScreen/login_screen.dart';
import 'screens/MainPageScreen_Feeds/postList_screen.dart';
import 'screens/SearchScreen/search_screen.dart';
import 'screens/IntroScreen/signup_screen.dart';

// the main insta app which starts the whole app XD ;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Insta());
}

class Insta extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Authentication(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Posts(),
        ),
      ],
      child: MaterialApp(
        title: 'Instagram Clone App!',
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
          // AddPost.route: (ctx) => AddPost(),
          EditProfile.route: (ctx) => EditProfile(),
        },
      ),
    );
  }
}
