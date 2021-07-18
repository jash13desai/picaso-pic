// import 'package:flutter/material.dart';

// class AccountPage extends StatelessWidget {
//   const AccountPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'package:insta_ui_only/widgets/stories_widget.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/models/story.dart';
import 'package:insta_ui_only/models/user.dart';
import 'package:insta_ui_only/myColors.dart';
import 'package:insta_ui_only/myFonts.dart';
import 'package:insta_ui_only/mySpaces.dart';
import 'package:insta_ui_only/providers/misc_data.dart';
import 'package:insta_ui_only/sizeConfig.dart';

class AccountPage extends StatelessWidget {
  final User data = DummyData().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? kWhite
              : kBlack,
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
                          storyName: '',
                        ),
                        // Container(
                        //   padding: const EdgeInsets.all(5),
                        //   decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       border: Border.all(
                        //         width: 1,
                        //         color: storyColor,
                        //       )),
                        //   child: CircleAvatar(
                        //     backgroundImage: AssetImage(data.imageUrl),
                        //     radius: SizeConfig.horizontalBlockSize * 12,
                        //   ),
                        // ),
                        MySpaces.hGapInBetween,
                        Expanded(
                          child: DefaultTextStyle(
                            style: MyFonts.medium.size(18),
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
                          style: MyFonts.light.setColor(kWhite).size(17),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          backgroundColor: kBlack,
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
                    MySpaces.vSmallestGapInBetween,
                    Container(
                      // color: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: SizeConfig.verticalBlockSize * 14,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: storyColor,
                                )),
                            child: CircleAvatar(
                              child: Icon(
                                Icons.add,
                                size: SizeConfig.horizontalBlockSize * 8,
                              ),
                              radius: SizeConfig.horizontalBlockSize * 8,
                            ),
                          ),
                          MySpaces.hGapInBetween,
                          StoryWidget(
                            storyImage:
                                AssetImage("assets/images/labyrinth.jpg"),
                            storyName: 'Your Story',
                          ),
                          MySpaces.hGapInBetween,
                          StoryWidget(
                            storyImage:
                                AssetImage("assets/images/labyrinth.jpg"),
                            storyName: 'Your Story',
                          ),
                          MySpaces.hGapInBetween,
                          StoryWidget(
                            storyImage:
                                AssetImage("assets/images/labyrinth.jpg"),
                            storyName: 'Your Story',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: kWhite.withOpacity(0.2),
                height: 0.5,
              ),
              MySpaces.vGapInBetween,
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
                  return Image.asset(data.userPosts[index]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
