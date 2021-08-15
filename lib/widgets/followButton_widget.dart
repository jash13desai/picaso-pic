import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/sizeConfig.dart';
// import 'package:instagram_ui_clone/screens/signup.dart';

class FollowButton extends StatefulWidget {
  final String text;
  final String currentUser;
  final List followers;

  const FollowButton(this.text, this.currentUser, this.followers);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  final _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(color: Colors.pink))
        : Container(
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.verticalBlockSize * 1,
            ),
            width: double.infinity,
            child: TextButton(
              child: Text(
                widget.text,
                style: MyFonts.light
                    .setColor(MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .size(18),
              ),
              style: (widget.text == "Follow")
                  ? TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    )
                  : TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      // backgroundColor: Colors.black,
                      backgroundColor:
                          MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Colors.white
                              : Colors.grey.shade900,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: MediaQuery.of(context).platformBrightness ==
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
              onPressed: () async {
                print(widget.text);
                setState(
                  () {
                    isLoading = true;
                  },
                );
                if (widget.text == "Follow") {
                  List<dynamic> followingList;
                  final newFollowers = widget.followers
                    ..add(_auth.currentUser.uid);

                  _db.collection('users').doc(_auth.currentUser.uid).get().then(
                    (value) {
                      followingList = value.data()['following'];
                      followingList.add(widget.currentUser);
                    },
                  );

                  await _db
                      .collection('users')
                      .doc(widget.currentUser)
                      .update({'followers': newFollowers});

                  await _db
                      .collection('users')
                      .doc(_auth.currentUser.uid)
                      .update({'following': followingList});
                } else {
                  final newFollowers = widget.followers
                    ..remove(_auth.currentUser.uid);

                  final response = await _db
                      .collection('users')
                      .doc(_auth.currentUser.uid)
                      .get();
                  final List<dynamic> followingList =
                      response.data()['following'];
                  final newFollowing = followingList
                    ..remove(widget.currentUser);
                  await _db
                      .collection('users')
                      .doc(widget.currentUser)
                      .update({'followers': newFollowers});

                  await _db
                      .collection('users')
                      .doc(_auth.currentUser.uid)
                      .update({'following': newFollowing});
                }
                setState(
                  () {
                    isLoading = false;
                  },
                );
              },
            ),
          );
  }
}
