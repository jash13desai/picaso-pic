import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/sizeConfig.dart';
import 'package:insta_ui_only/providers/posts.dart';
import 'package:insta_ui_only/widgets/PostWidget/post_widget.dart';
import 'package:insta_ui_only/widgets/StoriesWidget/grey_ring_widget.dart';
// import 'package:insta_ui_only/widgets/caughtUp_widget.dart';
import 'package:provider/provider.dart';
import 'stories_screen.dart';

class InstaList extends StatelessWidget {
  static const route = '/postList_screen';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(child: InstaStories(), height: 125),
          ),
          (Provider.of<Posts>(context, listen: false).queryList.isEmpty)
              ? Column(
                  children: [
                    Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: GreyRing(
                              padding: 20,
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.userAlt,
                                  size: SizeConfig.horizontalBlockSize * 10,
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            // padding: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.only(bottom: 18),
                            child: Text(
                              "Follow someone to see their posts in feed",
                              overflow: TextOverflow.ellipsis,
                              style: MyFonts.light.size(15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // CaughtUp(),
                  ],
                )
              : StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('posts')
                      .where('addedBy',
                          whereIn: Provider.of<Posts>(context).queryList)
                      .snapshots(),
                  builder: (context, snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(color: Colors.pink);
                    }
                    return Column(
                      children: Provider.of<Posts>(context)
                          .setViva(snapshots.data.docs)
                          .map(
                        (post) {
                          return PostWidget(post);
                        },
                      ).toList(),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
