import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_ui_only/functions/upload_image.dart' as imageUpload;
import 'package:insta_ui_only/globals/sizeConfig.dart';
import 'package:insta_ui_only/providers/posts.dart';
import 'package:insta_ui_only/screens/MainPageScreen_Feeds/postList_screen.dart';
import 'package:insta_ui_only/widgets/BottomNavBar/bottomNavBar_main.dart';
import 'package:provider/provider.dart';
import '../DMScreen/dm_screen.dart';

// upper navigation bar for the main screen

class InstaHome extends StatefulWidget {
  static const route = '/homeBar_screen';

  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  // @override
  // void initState() {
  //   Provider.of<Posts>(context, listen: false).fetchAndSetPosts();
  //   super.initState();
  // }
  bool isLoading = true;
  @override
  void initState() {
    Provider.of<Posts>(context, listen: false).fetchFollowingData().then(
      (_) {
        setState(
          () {
            isLoading = false;
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    imageUpload.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => imageUpload.navigate(),
            icon: Icon(
              Icons.camera_alt,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
            ),
          ),
          title: SizedBox(
            height: 40.0,
            child: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Image.asset("assets/images/insta_logo_light.jpg")
                : Image.asset("assets/images/insta_logo_dark.jpg"),
          ),
          actions: <Widget>[
            // IconButton(
            //   onPressed: () => {},
            //   icon:
            //       MediaQuery.of(context).platformBrightness == Brightness.light
            //           ? Image.asset('assets/icons/igtv_icon_light.jpg')
            //           : Image.asset('assets/icons/igtv_icon_dark.jpg'),
            //   iconSize: 5,
            // ),
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookMessenger),
              iconSize: 25,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(DMPage.route);
              },
            ),
          ],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.pink))
            : InstaList(),
        bottomNavigationBar: BottomNavBarMain(),
      ),
    );
  }
}
