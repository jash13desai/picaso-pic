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

// The bottom navigation bar which takes argument for showing the highlighted screen tab button when on the respective screen


class BottomNavBarMain extends StatelessWidget {
  final int argument;
  BottomNavBarMain({this.argument});

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
            RadiantGradientMask2(
              child: IconButton(
                icon: GradientIcon(
                  Icons.add_box_rounded,
                  38,
                  LinearGradient(
                    colors: <Color>[
                      Colors.purple[200],
                      Colors.orange[300],
                      Colors.purple[100],
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(ImageSource.gallery),
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
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topRight,
        radius: 1,
        colors: [Colors.purple[400], Colors.pink[200], Colors.purple],
        tileMode: TileMode.clamp,
      ).createShader(bounds),
      child: child,
    );
  }
}
