// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:insta_ui_only/providers/misc_data.dart';
import 'package:insta_ui_only/screens/account_screen.dart';
import 'dm_list_screen.dart';
import 'homeBar_screen.dart';
// import 'package:insta_ui_only/functions/upload_image.dart' as imageUpload;

class DMPage extends StatelessWidget {
  static const route = '/dm_screen';
  final User data = MyUserData().currentUser;
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
        title: SizedBox(
          height: 35.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AccountPage.route);
                },
                icon: Container(
                  child: Text(
                    // FirebaseAuth.instance.currentUser.displayName,\
                    data.displayname,
                    style: TextStyle(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                iconSize: 77,
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AccountPage.route);
                },
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ],
          ),
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
      body: DMScrollList(),
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
