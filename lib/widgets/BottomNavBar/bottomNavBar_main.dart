import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_ui_only/screens/accountScreen/account_screen.dart';
import 'package:insta_ui_only/screens/ActivityScreen/activity_screen.dart';
import 'package:insta_ui_only/screens/AddPostScreen/add_post.dart';
import 'package:insta_ui_only/screens/MainPageScreen_Feeds/homeBar_screen.dart';
import 'package:insta_ui_only/screens/SearchScreen/search_screen.dart';
// import 'package:insta_ui_only/widgets/iconGradient.dart';

// The bottom navigation bar which takes argument for showing the highlighted screen tab button when on the respective screen

class BottomNavBarMain extends StatelessWidget {
  final int argument;
  BottomNavBarMain({
    this.argument,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: MediaQuery.of(context).platformBrightness == Brightness.light
      //     ? Colors.white
      //     : Colors.black,
      color: Colors.black.withOpacity(0.2),
      height: 50.0,
      alignment: Alignment.center,
      child: BottomAppBar(
        // color: MediaQuery.of(context).platformBrightness == Brightness.light
        //     ? Colors.white
        //     : Colors.black,
        color: Colors.black.withOpacity(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: argument == 1
                    ? MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white
                    : MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.grey[700]
                        : Colors.grey,
              ),
              iconSize: 32,
              onPressed: () {
                Navigator.of(context).pushNamed(InstaHome.route);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: argument == 2
                    ? MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black
                        : Colors.white
                    : MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.grey[700]
                        : Colors.grey,
              ),
              iconSize: 33,
              onPressed: () {
                Navigator.of(context).pushNamed(SearchPage.route);
              },
            ),
            Material(
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                splashColor: Colors.redAccent.shade400,
                borderRadius: BorderRadius.circular(30),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(ImageSource.gallery),
                  ),
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) => RadialGradient(
                    center: Alignment.topRight,
                    radius: 10,
                    colors: [
                      Colors.purple[400],
                      Colors.pink[400],
                      Colors.purpleAccent[400],
                    ],
                    tileMode: TileMode.clamp,
                  ).createShader(bounds),
                  child: Ink(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.pink[400],
                        width: 1.5,
                      ),
                    ),
                    child: RadiantGradientMask2(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.red.shade100,
                          ),
                        ),
                        child: Icon(
                          Icons.add_rounded,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: argument == 3
                  ? Icon(
                      FontAwesomeIcons.solidHeart,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                    )
                  : Icon(
                      FontAwesomeIcons.heart,
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.dark
                          ? Colors.grey[700]
                          : Colors.grey,
                    ),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushNamed(ActivityPage.route);
              },
            ),
            IconButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(FirebaseAuth
                        .instance.currentUser.photoURL ??
                    "https://i2.wp.com/wilkinsonschool.org/wp-content/uploads/2018/10/user-default-grey.png"),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AccountPage.route,
                  arguments: FirebaseAuth.instance.currentUser.uid,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RadiantGradientMask2 extends StatelessWidget {
  RadiantGradientMask2({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      child: ShaderMask(
        shaderCallback: (bounds) => RadialGradient(
          center: Alignment.topRight,
          radius: 1,
          colors: [
            Colors.purple[400],
            Colors.pink[400],
            Colors.purpleAccent[400],
          ],
          tileMode: TileMode.clamp,
        ).createShader(bounds),
        child: child,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
