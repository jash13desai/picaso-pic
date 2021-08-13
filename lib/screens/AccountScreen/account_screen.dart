import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'package:insta_ui_only/globals/sizeConfig.dart';

import 'package:insta_ui_only/screens/IntroScreen/login_screen.dart';
import 'package:insta_ui_only/screens/MainPageScreen_Feeds/homeBar_screen.dart';
import 'package:insta_ui_only/widgets/BottomNavBar/bottomNavBar_main.dart';
import 'package:insta_ui_only/widgets/PostWidget/profilePhoto_widget.dart';
import 'package:insta_ui_only/widgets/StoriesWidget/stories_widget.dart';

import 'package:insta_ui_only/widgets/followButton_widget.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
// import 'editProfile_screen.dart';

class AccountPage extends StatelessWidget {
  static const route = '/account_screen';
  // final user.User data = MyUserData().currentUser;
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final currentUser = ModalRoute.of(context).settings.arguments as String;
    return StreamBuilder2(
      streams: Tuple2(
        _db
            .collection('posts')
            .where('addedBy', isEqualTo: _db.doc('/users/$currentUser'))
            .snapshots(),
        _db.collection('users').doc(currentUser).snapshots(),
      ),
      builder: (context, snapshots) {
        if (snapshots.item1.connectionState == ConnectionState.waiting &&
            snapshots.item2.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: Colors.pink),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor:
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
            actionsIconTheme: IconThemeData(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
            ),
            centerTitle: false,
            elevation: 1.0,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(InstaHome.route);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(width: 80),
                Icon(
                  Icons.lock_rounded,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                Container(
                  child: Text(
                    // data.displayname,
                    // FirebaseAuth.instance.currentUser.displayName,
                    snapshots.item2.data['user_name'],
                    style: TextStyle(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfilePhoto(
                              imageUrl: snapshots.item2.data['imageUrl'] ??
                                  "https://i2.wp.com/wilkinsonschool.org/wp-content/uploads/2018/10/user-default-grey.png",
                            ),
                            MySpaces.hGapInBetween,
                            Expanded(
                              child: DefaultTextStyle(
                                style: MyFonts.medium.size(18).setColor(
                                      MediaQuery.of(context)
                                                  .platformBrightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                            "${snapshots.item1.data.docs.length}" ??
                                                ''),
                                        Text("Posts"),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            "${snapshots.item2.data['followers'].length}"),
                                        Text("Followers"),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                            "${snapshots.item2.data['following'].length}"),
                                        Text("Following"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        MySpaces.vGapInBetween,
                        Text(
                          // data.displayname,
                          // FirebaseAuth.instance.currentUser.displayName,
                          snapshots.item2.data['user_name'] ?? 'Nil',
                          style: MyFonts.light.size(15),
                        ),
                        Text(
                          'I had all and then most of you, some and now none of you!',
                          style: MyFonts.light.size(15),
                        ),
                        MySpaces.vGapInBetween,
                        (currentUser == _auth.currentUser.uid)
                            ? Container(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: () {
                                    _auth.signOut();
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                      LogIn.route,
                                      (route) => false,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.logout_outlined,
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.light
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                      MySpaces.hGapInBetween,
                                      Text(
                                        "Log Out",
                                        style: MyFonts.light
                                            .setColor(MediaQuery.of(context)
                                                        .platformBrightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : Colors.black)
                                            .size(17),
                                      ),
                                    ],
                                  ),
                                  style: TextButton.styleFrom(
                                    backgroundColor: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Colors.white
                                        : Colors.grey.shade900,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? Colors.white.withOpacity(0.5)
                                            : Colors.black.withOpacity(0.5),
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : (snapshots.item2.data['followers'] as List)
                                    .contains(_auth.currentUser.uid)
                                ? FollowButton("Following", currentUser,
                                    snapshots.item2.data['followers'] as List)
                                : FollowButton("Follow", currentUser,
                                    snapshots.item2.data['followers'] as List),
                        // MySpaces.vGapInBetween,
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 10),
                        //   child: Container(
                        //     width: double.infinity,
                        //     child: TextButton(
                        //       onPressed: () => Navigator.of(context)
                        //           .popAndPushNamed(EditProfile.route),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(
                        //             Icons.edit,
                        //             color: MediaQuery.of(context)
                        //                         .platformBrightness ==
                        //                     Brightness.light
                        //                 ? Colors.black
                        //                 : Colors.white,
                        //             size: 22,
                        //           ),
                        //           MySpaces.hGapInBetween,
                        //           Text(
                        //             "Edit Profile",
                        //             style: MyFonts.light
                        //                 .setColor(MediaQuery.of(context)
                        //                             .platformBrightness ==
                        //                         Brightness.dark
                        //                     ? Colors.white
                        //                     : Colors.black)
                        //                 .size(17),
                        //           ),
                        //         ],
                        //       ),
                        //       style: TextButton.styleFrom(
                        //         backgroundColor:
                        //             MediaQuery.of(context).platformBrightness ==
                        //                     Brightness.light
                        //                 ? Colors.white
                        //                 : Colors.grey.shade900,
                        //         shape: RoundedRectangleBorder(
                        //           side: BorderSide(
                        //             color: MediaQuery.of(context)
                        //                         .platformBrightness ==
                        //                     Brightness.dark
                        //                 ? Colors.white.withOpacity(0.5)
                        //                 : Colors.black.withOpacity(0.5),
                        //             width: 0.5,
                        //           ),
                        //           borderRadius: BorderRadius.all(
                        //             Radius.circular(8),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // MySpaces.hSmallGapInBetween,
                        MySpaces.vSmallestGapInBetween,
                        Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                height: 89,
                                width: 1000,
                                child: new ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  itemBuilder: (context, index) => Stack(
                                    alignment: Alignment.topLeft,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          StoryWidget(
                                            storyImage: AssetImage(
                                                "assets/images/user-default-grey.png"),
                                            storyName: 'Foods',
                                          ),
                                          StoryWidget(
                                            storyImage: AssetImage(
                                                "assets/images/user-default-grey.png"),
                                            storyName: 'Homies',
                                          ),
                                          StoryWidget(
                                            storyImage: AssetImage(
                                                "assets/images/user-default-grey.png"),
                                            storyName: 'Travels',
                                          ),
                                          StoryWidget(
                                            storyImage: AssetImage(
                                                "assets/images/user-default-grey.png"),
                                            storyName: 'Parties',
                                          ),
                                          StoryWidget(
                                            storyImage: AssetImage(
                                                "assets/images/user-default-grey.png"),
                                            storyName: 'Clubs',
                                          ),
                                          StoryWidget(
                                            storyImage: AssetImage(
                                                "assets/images/user-default-grey.png"),
                                            storyName: 'Sports',
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ((snapshots.item2.data['followers'] as List)
                              .contains(_auth.currentUser.uid) ||
                          currentUser == _auth.currentUser.uid)
                      ? (snapshots.item1.data.docs.length == 0)
                          ? Text(
                              "No Posts to show...",
                              style: MyFonts.light.size(15),
                            )
                          : GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                              ),
                              itemCount: snapshots.item1.data.docs.length,
                              itemBuilder: (ctx, index) {
                                final data = snapshots.item1.data.docs[index]
                                    .data() as Map<String, dynamic>;
                                return Image.network(
                                  data['imageUrl'],
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                      : Center(
                          child: Text(
                            "Follow this account to see their posts",
                            style: MyFonts.light
                                .size(SizeConfig.horizontalBlockSize * 5),
                          ),
                        ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBarMain(),
        );
      },
    );
  }
}
