import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_ui_only/screens/accountScreen/account_screen.dart';
import 'package:insta_ui_only/screens/ActivityScreen/activity_screen.dart';
import 'package:insta_ui_only/screens/AddPostScreen/add_post.dart';
import 'package:insta_ui_only/screens/MainPageScreen_Feeds/homeBar_screen.dart';
import 'package:insta_ui_only/screens/SearchScreen/search_screen.dart';
import 'package:insta_ui_only/widgets/iconGradient.dart';

class BottomNavBarMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MediaQuery.of(context).platformBrightness == Brightness.light
          ? Colors.white
          : Colors.black,
      height: 50.0,
      alignment: Alignment.center,
      child: BottomAppBar(
        color: MediaQuery.of(context).platformBrightness == Brightness.light
            ? Colors.white
            : Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
              icon: Icon(
                Icons.home_outlined,
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(InstaHome.route);
              },
            ),
            IconButton(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
              icon: Icon(
                Icons.search,
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(SearchPage.route);
              },
            ),
            RadiantGradientMask2(
              child: IconButton(
                icon: GradientIcon(
                  Icons.add_box_rounded,
                  38,
                  LinearGradient(
                    colors: <Color>[
                      Colors.purple[200],
                      Colors.orange[300],
                      Colors.purple[200],
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                // onPressed: () => imageUpload.pickImage(ImageSource.gallery),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(ImageSource.gallery),
                  ),
                ),
              ),
            ),
            IconButton(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
              icon: Icon(FontAwesomeIcons.heart),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(ActivityPage.route);
              },
            ),
            IconButton(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
              // icon: Icon(
              //   MediaQuery.of(context).platformBrightness == Brightness.dark
              //       ? Icons.account_box
              //       : Icons.account_box_outlined,
              // ),
              icon: CircleAvatar(
                backgroundImage: NetworkImage(FirebaseAuth
                        .instance.currentUser.photoURL ??
                    "https://i2.wp.com/wilkinsonschool.org/wp-content/uploads/2018/10/user-default-grey.png"),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(
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
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topRight,
        radius: 1,
        colors: [Colors.purple[200], Colors.pink[200], Colors.purple[400]],
        tileMode: TileMode.clamp,
      ).createShader(bounds),
      child: child,
    );
  }
}
