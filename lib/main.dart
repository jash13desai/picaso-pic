import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/screens/intro_screen.dart';
import 'package:insta_ui_only/theme.dart';

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
            return Intro();
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ),
            );
          }
        },
      ),
    );
  }
}

//  insta pe ab authorization h orr baaki ke features add krne h -- week3 k tasks!

//renamed the main folder of the project for Week03-Tasks -- just to check whether things go smooth on
// renaming both the project from both the ends! :)

// Edit -- Yupp the renaming worked perfectly even the url works fine :)
