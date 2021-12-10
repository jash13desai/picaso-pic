import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/sizeConfig.dart';
import 'package:insta_ui_only/screens/AccountScreen/account_screen.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import '../../models/post.dart';
import 'postComment_Widget.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  const PostWidget(this.post);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLikePressed = false;
  bool isBookPressed = false;
  String profileUrl;
  String name;
  String userId;
  bool isLoading = true;

  final _auth = FirebaseAuth.instance;

  final CollectionReference _db =
      FirebaseFirestore.instance.collection('posts');

  @override
  void initState() {
    isLikePressed = widget.post.likedBy
        .contains(FirebaseAuth.instance.currentUser.displayName);
    widget.post.addedBy.get().then(
      (response) {
        final data = response.data() as Map<String, dynamic>;
        profileUrl = data['imageUrl'];
        name = data['user_name'];
        userId = data['userId'];
        setState(() {
          isLoading = false;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          padding: EdgeInsets.all(0.01),
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              AccountPage.route,
                              arguments: userId,
                            );
                          },
                          icon: CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(
                              profileUrl ??
                                  "https://i2.wp.com/wilkinsonschool.org/wp-content/uploads/2018/10/user-default-grey.png",
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: MyFonts.medium.size(16),
                            ),
                            Text(widget.post.location),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onDoubleTap: () async {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  try {
                    setState(
                      () {
                        isLikePressed = !isLikePressed;
                      },
                    );
                    isLikePressed
                        ? await _db.doc(widget.post.docId).update(
                            {
                              'likedBy': widget.post.likedBy
                                ..insert(0, _auth.currentUser.displayName)
                            },
                          )
                        : await _db.doc(widget.post.docId).update(
                            {
                              'likedBy': widget.post.likedBy
                                ..remove(_auth.currentUser.displayName)
                            },
                          );
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Unable to like the post :`(",
                        ),
                      ),
                    );
                    setState(
                      () {
                        isLikePressed = !isLikePressed;
                      },
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: isLikePressed
                          ? Text("You liked the post! :) ")
                          : Text("You unliked the post! :( "),
                    ),
                  );
                },
                child: Container(
                  child: Image.network(
                    widget.post.postUrl,
                    fit: BoxFit.cover,
                  ),
                  alignment: Alignment.center,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.white
                      : Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        iconSize: 25,
                        icon: Icon(
                          isLikePressed
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                        ),
                        color: isLikePressed
                            ? Colors.red
                            : Theme.of(context).colorScheme.onBackground,
                        onPressed: () async {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          try {
                            setState(() {
                              isLikePressed = !isLikePressed;
                            });
                            isLikePressed
                                ? await _db.doc(widget.post.docId).update(
                                    {
                                      'likedBy': widget.post.likedBy
                                        ..insert(
                                            0, _auth.currentUser.displayName)
                                    },
                                  )
                                : await _db.doc(widget.post.docId).update(
                                    {
                                      'likedBy': widget.post.likedBy
                                        ..remove(_auth.currentUser.displayName)
                                    },
                                  );
                          } catch (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Unable to like the post :`(",
                                ),
                              ),
                            );
                            setState(() {
                              isLikePressed = !isLikePressed;
                            });
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              content: isLikePressed
                                  ? Text("You liked the post! :) ")
                                  : Text("You unliked the post! :( "),
                            ),
                          );
                        },
                      ),
                      new IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.commentAlt,
                        ),
                        iconSize: 24,
                      ),
                      // Share Icon!
                      new IconButton(
                        iconSize: 24,
                        onPressed: () {
                          // Share.share(
                          // 'Check out this post on the My InstaClone App: hello!',
                          // subject:
                          // 'Check out this post on the My InstaClone App',
                          // );
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                padding:
                                    const EdgeInsets.only(bottom: 20, top: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      leading: new Icon(Icons.link),
                                      title: Text('Share Link'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: new Icon(
                                        FontAwesomeIcons.whatsapp,
                                        color: Colors.tealAccent,
                                      ),
                                      title: Text('Whatsapp'),
                                      onTap: () {
                                        Share.share(
                                          'Check out this post on the My InstaClone App: ${widget.post.postUrl}',
                                        );
                                      },
                                    ),
                                    ListTile(
                                      leading: new Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      title: Text('Exit'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(FontAwesomeIcons.paperPlane),
                      ),
                    ],
                  ),
                  IconButton(
                    iconSize: 22,
                    icon: Icon(
                      !isBookPressed
                          ? FontAwesomeIcons.bookmark
                          : FontAwesomeIcons.solidBookmark,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          isBookPressed = !isBookPressed;
                        },
                      );
                      isBookPressed == true
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 1),
                                content: Text('You Bookmarked the post! :) '),
                              ),
                            )
                          : ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 1),
                                content: Text('You removed the bookmark! :( '),
                              ),
                            );
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    if (widget.post.likedBy.isNotEmpty)
                      Text(
                        (widget.post.likedBy.length == 1)
                            ? "Liked by ${widget.post.likedBy[0]}"
                            : "Liked by ${widget.post.likedBy[0]} and ${widget.post.likedBy.length - 1} others",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: RichText(
                  text: TextSpan(
                    text: name + " ",
                    style: MyFonts.bold.size(SizeConfig.textScaleFactor * 17),
                    children: [
                      TextSpan(
                        text: widget.post.caption,
                        style:
                            MyFonts.light.size(SizeConfig.textScaleFactor * 15),
                      )
                    ],
                  ),
                ),
              ),
              PostCommentWidget(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 22),
                child: Text(
                  DateFormat("MMMM dd, yy").format(widget.post.date),
                  style: MyFonts.thin.setColor(Colors.grey[700]),
                ),
              ),
              SizedBox(height: 20)
            ],
          );
  }
}
