import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'package:insta_ui_only/globals/sizeConfig.dart';
import 'package:intl/intl.dart';
import '../models/post.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget(this.post);

  // final AssetImage accountImage;
  // final String accountName;
  // final Image mainPostImage;
  // final AssetImage likedImage;
  // final String twoNames;
  // final String likes;
  // final String caption;
  // final String time;
  // PostWidget({
  //   this.accountImage,
  //   this.accountName,
  //   this.mainPostImage,
  //   this.likedImage,
  //   this.twoNames,
  //   this.likes,
  //   this.caption,
  //   this.time,
  // });

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLikePressed = false;
  bool isBookPressed = false;
  String profileUrl;
  String name;
  bool isLoading = true;

  @override
  void initState() {
    widget.post.addedBy.get().then((response) {
      final data = response.data() as Map<String, dynamic>;
      profileUrl = data['imageUrl'];
      name = data['user_name'];
      setState(() {
        isLoading = false;
      });
    });

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
                padding: EdgeInsets.fromLTRB(16.0, 4.0, 8.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              // image: widget.accountImage,
                              image: NetworkImage(profileUrl ??
                                  "https://i2.wp.com/wilkinsonschool.org/wp-content/uploads/2018/10/user-default-grey.png"),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: MyFonts.medium.size(16),
                            ),
                            MySpaces.vSmallestGapInBetween,
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
              // Padding(
              //   padding: const EdgeInsets.only(left: 0),
              //   child: Flexible(
              //     fit: FlexFit.loose,
              //     child: Image.network(
              //       widget.post.postUrl,
              //       fit: BoxFit.contain,
              //     ),
              //   ),
              // ),
              // Flexible(
              //   fit: FlexFit.loose,
              //   child: Image.network(
              //     widget.post.postUrl,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Container(
                child: Flexible(
                  fit: FlexFit.loose,
                  child: Image.network(
                    widget.post.postUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                constraints: BoxConstraints(maxWidth: double.infinity),
                alignment: Alignment.center,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.white
                    : Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new IconButton(
                          icon: Icon(
                            isLikePressed
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                          ),
                          color: isLikePressed
                              ? Colors.red
                              : Theme.of(context).colorScheme.onBackground,
                          onPressed: () {
                            setState(
                              () {
                                isLikePressed = !isLikePressed;
                              },
                            );
                            isLikePressed == true
                                ? ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 2),
                                      content: Text('You liked the post! :) '),
                                    ),
                                  )
                                : ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 2),
                                      content:
                                          Text('You unliked the post! :( '),
                                    ),
                                  );
                          },
                        ),
                        new IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.comment,
                          ),
                        ),
                        new IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.paperPlane),
                        ),
                      ],
                    ),
                    IconButton(
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
                                  duration: const Duration(seconds: 2),
                                  content: Text('You Bookmarked the post! :) '),
                                ),
                              )
                            : ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: const Duration(seconds: 2),
                                  content:
                                      Text('You removed the bookmark! :( '),
                                ),
                              );
                      },
                    )
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 8.0),
              //       child: Container(
              //         height: 25.0,
              //         width: 25.0,
              //         decoration: new BoxDecoration(
              //           shape: BoxShape.circle,
              //           image: new DecorationImage(
              //             fit: BoxFit.cover,
              //             image: widget.likedImage,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
              //       child: Row(
              //         children: [
              //           Text(
              //             "Liked by ",
              //           ),
              //           Text(
              //             widget.twoNames,
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //           Text(
              //             " and ",
              //           ),
              //           Text(
              //             widget.likes,
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //           Text(
              //             " others",
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: name + " ",
                    style: MyFonts.medium.size(SizeConfig.textScaleFactor * 17),
                    children: [
                      TextSpan(
                          text: widget.post.caption,
                          style: MyFonts.light
                              .size(SizeConfig.textScaleFactor * 15))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              // profileUrl ??
                              "https://i2.wp.com/wilkinsonschool.org/wp-content/uploads/2018/10/user-default-grey.png"),
                        ),
                      ),
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: new TextField(
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a comment...",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MySpaces.vGapInBetween,
              Text(
                DateFormat('MMMM dd , yy').format(widget.post.date),
                style: MyFonts.thin.setColor(Colors.grey[700]),
              ),
              MySpaces.vGapInBetween,
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(8, 0, 0, 20),
              //   // child: Text(
              //   //   widget.time,
              //   //   style: TextStyle(
              //   //     color: Colors.grey,
              //   //   ),
              //   // ),
              // ),
            ],
          );
  }
}
