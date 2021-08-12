import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as db;
import 'package:flutter/material.dart';

import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'package:insta_ui_only/providers/misc_data.dart';
import 'package:insta_ui_only/screens/IntroScreen/signup_screen.dart';
import 'package:insta_ui_only/screens/MainPageScreen_Feeds/homeBar_screen.dart';
import 'package:insta_ui_only/widgets/BottomNavBar/bottomNavBar_main.dart';
import 'package:insta_ui_only/widgets/PostWidget/profilePhoto_widget.dart';
import 'package:insta_ui_only/widgets/StoriesWidget/stories_widget.dart';
import 'package:insta_ui_only/models/user.dart' as user;
import 'editProfile_screen.dart';

class AccountPage extends StatefulWidget {
  static const route = '/account_screen';

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user.User data = MyUserData().currentUser;

  final _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final currentUser = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black,
        actionsIconTheme: IconThemeData(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
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
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        title: SizedBox(
          height: 35.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 40),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.lock_rounded,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                iconSize: 20,
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                  child: Text(
                    // data.displayname,
                    FirebaseAuth.instance.currentUser.displayName,
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
                onPressed: () {},
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
                        ProfilePhoto(),
                        MySpaces.hGapInBetween,
                        Expanded(
                          child: DefaultTextStyle(
                            style: MyFonts.medium.size(18).setColor(
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text("${data.postNum}"),
                                    Text("Posts"),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("${data.followers}"),
                                    Text("Followers"),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("${data.following}"),
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
                      FirebaseAuth.instance.currentUser.displayName,
                      style: MyFonts.light.size(15),
                    ),
                    Text(
                      data.bio,
                      style: MyFonts.light.size(15),
                    ),
                    MySpaces.vGapInBetween,
                    (currentUser == FirebaseAuth.instance.currentUser.uid)
                        ? Container(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                db.FirebaseAuth.instance.signOut();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  SignUp.route,
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
                                backgroundColor:
                                    MediaQuery.of(context).platformBrightness ==
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
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        // widget.whichOne = 1.1;
                                      },
                                    );
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.fromBorderSide(
                                          BorderSide.none),
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        child: Center(
                                          child: Text(
                                            'Follow',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    // MySpaces.vGapInBetween,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => Navigator.of(context)
                              .popAndPushNamed(EditProfile.route),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                                size: 22,
                              ),
                              MySpaces.hGapInBetween,
                              Text(
                                "Edit Profile",
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
                            backgroundColor:
                                MediaQuery.of(context).platformBrightness ==
                                        Brightness.light
                                    ? Colors.white
                                    : Colors.grey.shade900,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color:
                                    MediaQuery.of(context).platformBrightness ==
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
                      ),
                    ),
                    MySpaces.hSmallGapInBetween,
                    // (currentUser == FirebaseAuth.instance.currentUser.uid)
                    //     ? Padding(
                    //         padding: const EdgeInsets.only(bottom: 10),
                    //         child: Container(
                    //           width: double.infinity,
                    //           child: TextButton(
                    //             onPressed: () {
                    //               db.FirebaseAuth.instance.signOut();
                    //               Navigator.of(context).pushNamedAndRemoveUntil(
                    //                 SignUp.route,
                    //                 (route) => false,
                    //               );
                    //             },
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Icon(
                    //                   Icons.logout_outlined,
                    //                   color: MediaQuery.of(context)
                    //                               .platformBrightness ==
                    //                           Brightness.light
                    //                       ? Colors.black
                    //                       : Colors.white,
                    //                 ),
                    //                 MySpaces.hGapInBetween,
                    //                 Text(
                    //                   "Log Out",
                    //                   style: MyFonts.light
                    //                       .setColor(MediaQuery.of(context)
                    //                                   .platformBrightness ==
                    //                               Brightness.dark
                    //                           ? Colors.white
                    //                           : Colors.black)
                    //                       .size(17),
                    //                 ),
                    //               ],
                    //             ),
                    //             style: TextButton.styleFrom(
                    //               backgroundColor: MediaQuery.of(context)
                    //                           .platformBrightness ==
                    //                       Brightness.light
                    //                   ? Colors.white
                    //                   : Colors.grey.shade900,
                    //               shape: RoundedRectangleBorder(
                    //                 side: BorderSide(
                    //                   color: MediaQuery.of(context)
                    //                               .platformBrightness ==
                    //                           Brightness.dark
                    //                       ? Colors.white.withOpacity(0.5)
                    //                       : Colors.black.withOpacity(0.5),
                    //                   width: 0.5,
                    //                 ),
                    //                 borderRadius: BorderRadius.all(
                    //                   Radius.circular(8),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     : Center(
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(bottom: 10),
                    //           child: Container(
                    //             width: MediaQuery.of(context).size.width * 0.5,
                    //             child: GestureDetector(
                    //               onTap: () {
                    //                 setState(
                    //                   () {
                    //                     // widget.whichOne = 1.1;
                    //                   },
                    //                 );
                    //               },
                    //               child: Ink(
                    //                 decoration: BoxDecoration(
                    //                   color: Colors.blue,
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   border: Border.fromBorderSide(
                    //                       BorderSide.none),
                    //                 ),
                    //                 child: InkWell(
                    //                   borderRadius: BorderRadius.circular(10),
                    //                   child: Container(
                    //                     height: 30,
                    //                     width: 60,
                    //                     child: Center(
                    //                       child: Text(
                    //                         'Follow',
                    //                         style: TextStyle(
                    //                           color: Colors.white,
                    //                           fontWeight: FontWeight.w600,
                    //                           fontSize: 17.0,
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    MySpaces.vSmallestGapInBetween,
                    new Container(
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
              // GridView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 3,
              //     crossAxisSpacing: 5,
              //     mainAxisSpacing: 5,
              //   ),
              //   itemCount: data.userPosts.length,
              //   itemBuilder: (ctx, index) {
              //     return Image.asset(
              //       data.userPosts[index],
              //       fit: BoxFit.cover,
              //     );
              //   },
              // )
              StreamBuilder(
                stream: _db
                    .collection('posts')
                    .where('addedBy',
                        isEqualTo: _db.doc(
                            '/users/${FirebaseAuth.instance.currentUser.uid}'))
                    .snapshots(),
                builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        SizedBox(height: 25),
                        Center(
                          child:
                              Text("Something got wrong while fetching posts"),
                        ),
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text("Loading..."));
                  }
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (ctx, index) {
                      final data = snapshot.data.docs[index].data()
                          as Map<String, dynamic>;
                      return Image.network(data['imageUrl']);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarMain(),
    );
  }
}
