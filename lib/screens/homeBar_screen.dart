// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_ui_only/globals/myColors.dart';
import 'package:insta_ui_only/functions/upload_image.dart' as imageUpload;
import 'package:insta_ui_only/globals/sizeConfig.dart';
import 'package:insta_ui_only/providers/posts.dart';
import 'package:provider/provider.dart';

import 'add_post.dart';
import 'postList_screen.dart';
import 'search_screen.dart';
import 'account_screen.dart';
import 'activity_screen.dart';
import 'dm_screen.dart';

class InstaHome extends StatefulWidget {
  static const route = '/homeBar_screen';
  // final _auth = FirebaseAuth.instance;

  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  @override
  void initState() {
    Provider.of<Posts>(context, listen: false).oneTimeFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    imageUpload.init(context);
    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<Posts>(context, listen: false).fetchAndSetPosts();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => imageUpload.navigate(),
            icon: Icon(
              Icons.camera_alt,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? kBlack
                      : kWhite,
            ),
          ),
          title: SizedBox(
            height: 35.0,
            child: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Image.asset("assets/images/insta_logo_light.jpg")
                : Image.asset("assets/images/insta_logo_dark.jpg"),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () => {},
              icon:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Image.asset('assets/icons/igtv_icon_light.jpg')
                      : Image.asset('assets/icons/igtv_icon_dark.jpg'),
              iconSize: 5,
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: Icon(FontAwesomeIcons.paperPlane),
                iconSize: 25,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(DMPage.route);
                },
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Provider.of<Posts>(context, listen: false).fetchAndSetPosts();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              InstaList(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
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
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  icon: Icon(
                    Icons.home,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(InstaHome.route);
                  },
                ),
                IconButton(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.grey.shade700
                      : Colors.grey.shade700,
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SearchPage.route);
                  },
                ),
                IconButton(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                  icon: Icon(
                    Icons.add_box,
                  ),
                  // onPressed: () => imageUpload.pickImage(ImageSource.gallery),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPost(ImageSource.gallery),
                    ),
                  ),
                ),
                IconButton(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.grey.shade700
                      : Colors.grey.shade700,
                  icon: Icon(FontAwesomeIcons.heart),
                  iconSize: 20,
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ActivityPage.route);
                  },
                ),
                IconButton(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.grey.shade700
                      : Colors.grey.shade700,
                  icon: Icon(
                    MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Icons.account_box
                        : Icons.account_box_outlined,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AccountPage.route);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
