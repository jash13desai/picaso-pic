import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_ui_only/screens/search_screen.dart';
import 'package:insta_ui_only/widgets/stories_widget.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/myColors.dart';
import 'package:insta_ui_only/myFonts.dart';
import 'package:insta_ui_only/mySpaces.dart';
import 'package:insta_ui_only/providers/misc_data.dart';

import 'activity_screen.dart';
import 'homeBar_screen.dart';

class AccountPage extends StatelessWidget {
  final User data = MyUserData().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black,
        actionsIconTheme: IconThemeData(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? kBlack
              : kWhite,
        ),
        centerTitle: false,
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => InstaHome()));
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? kBlack
                : kWhite,
          ),
        ),
        title: SizedBox(
          height: 35.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MySpaces.hLargeGapInBetween,
              IconButton(
                onPressed: () {
                  // Navigator.pop(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AccountPage()),
                  // );
                },
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
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AccountPage()),
                  // );
                },
                icon: Container(
                  // height: MediaQuery.of(context).size.height * 0.3,
                  child: Text(
                    '_jade13._',
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => AccountPage()),
                  // );
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
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StoryWidget(
                          storyImage: AssetImage("assets/images/labyrinth.jpg"),
                          storyName: "",
                        ),
                        Expanded(
                          child: DefaultTextStyle(
                            style: MyFonts.medium.size(18).setColor(
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? kWhite
                                      : kBlack,
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
                      data.displayname,
                      style: MyFonts.light.size(15),
                    ),
                    Text(
                      data.bio,
                      style: MyFonts.light.size(15),
                    ),
                    MySpaces.vGapInBetween,
                    Container(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Edit Profile",
                          style: MyFonts.light
                              .setColor(
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? kWhite
                                      : kBlack)
                              .size(17),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor:
                              MediaQuery.of(context).platformBrightness ==
                                      Brightness.light
                                  ? kWhite
                                  : Colors.grey.shade900,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.dark
                                      ? kWhite.withOpacity(0.5)
                                      : kBlack.withOpacity(0.5),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: data.userPosts.length,
                itemBuilder: (ctx, index) {
                  return Image.asset(
                    data.userPosts[index],
                    fit: BoxFit.cover,
                  );
                },
              )
            ],
          ),
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
                    ? Colors.grey.shade700
                    : Colors.grey.shade700,
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InstaHome()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.add_box,
                ),
                onPressed: null,
              ),
              IconButton(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.grey.shade700
                    : Colors.grey.shade700,
                icon: Icon(FontAwesomeIcons.heart),
                iconSize: 20,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityPage()),
                  );
                },
              ),
              IconButton(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                icon: Icon(
                  Icons.account_box,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
