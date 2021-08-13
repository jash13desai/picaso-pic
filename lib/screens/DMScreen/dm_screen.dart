import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'package:insta_ui_only/screens/accountScreen/account_screen.dart';
import 'dm_list_screen.dart';
import '../MainPageScreen_Feeds/homeBar_screen.dart';

// manually made up dm screen with the use of widgets

class DMPage extends StatelessWidget {
  static const route = '/dm_screen';
  // final user.User data = MyUserData().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(InstaHome.route);
          },
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // IconButton(
            //   onPressed: () {
            //     Navigator.of(context).popAndPushNamed(InstaHome.route);
            //   },
            //   icon: Icon(
            //     Icons.arrow_back_ios_new,
            //     color: MediaQuery.of(context).platformBrightness ==
            //             Brightness.light
            //         ? Colors.black
            //         : Colors.white,
            //   ),
            // ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.18),
            Icon(
              Icons.lock_rounded,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
            ),
            MySpaces.hSmallGapInBetween,
            Container(
              child: Text(
                // data.displayname,
                FirebaseAuth.instance.currentUser.displayName,
                // snapshots.item2.data['user_name'],
                style: TextStyle(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            MySpaces.hSmallGapInBetween,
            Icon(
              Icons.keyboard_arrow_down,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 35,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      //
      body: DMScrollList(),
      //
      bottomNavigationBar: Container(
        color: MediaQuery.of(context).platformBrightness == Brightness.light
            ? Colors.white
            : Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.055,
        child: BottomAppBar(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.white
              : Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  RadiantGradientMask(
                    child: IconButton(
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          size: 35,
                        ),
                        onPressed: () => {}
                        // imageUpload.pickImage(ImageSource.camera),
                        ),
                  ),
                  Text(
                    "  Camera",
                    style: TextStyle(
                      color: Colors.blue.shade300,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topRight,
        radius: 1,
        colors: [Colors.blue.shade800, Colors.blue.shade300],
        tileMode: TileMode.clamp,
      ).createShader(bounds),
      child: child,
    );
  }
}
