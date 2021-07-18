import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostWidget extends StatefulWidget {
  final AssetImage accountImage;
  final String accountName;
  final Image mainPostImage;
  final AssetImage likedImage;
  final String twoNames;
  final String likes;
  final String caption;
  final String time;

  PostWidget({
    required this.accountImage,
    required this.accountName,
    required this.mainPostImage,
    required this.likedImage,
    required this.twoNames,
    required this.likes,
    required this.caption,
    required this.time,
  });

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLikePressed = false;
  bool isBookPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
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
                          image: widget.accountImage,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.accountName,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          // ),
                        ],
                      ),
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
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Flexible(
              fit: FlexFit.loose,
              child: widget.mainPostImage,
            ),
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
                                  content: Text('You unliked the post! :( '),
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
                              content: Text('You removed the bookmark! :( '),
                            ),
                          );
                  },
                )
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  height: 25.0,
                  width: 25.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.likedImage,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Liked by ",
                    ),
                    Text(
                      widget.twoNames,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " and ",
                    ),
                    Text(
                      widget.likes,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " others",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Text(
              widget.caption,
              style: TextStyle(fontWeight: FontWeight.w900),
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
                      image: new AssetImage("assets/images/labyrinth.jpg"),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 20),
            child: Text(
              widget.time,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
