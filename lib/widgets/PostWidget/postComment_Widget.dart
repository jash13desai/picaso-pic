import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/screens/accountScreen/account_screen.dart';

class PostCommentWidget extends StatefulWidget {
  @override
  _PostCommentWidgetState createState() => _PostCommentWidgetState();
}

class _PostCommentWidgetState extends State<PostCommentWidget> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // new Container(
              //   height: 40.0,
              //   width: 40.0,
              //   decoration: new BoxDecoration(
              //     shape: BoxShape.circle,
              //     image: new DecorationImage(
              //       fit: BoxFit.fill,
              //       image: NetworkImage(
              //           // profileUrl ??
              //           // 'images/${_auth.currentUser.uid}/profile_pic' ??
              //           "https://i2.wp.com/wilkinsonschool.org/wp-content/uploads/2018/10/user-default-grey.png"),
              //     ),
              //   ),
              // ),
              IconButton(
                iconSize: 35,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(_auth.currentUser.photoURL ??
                      "https://i2.wp.com/wilkinsonschool.org/wp-content/uploads/2018/10/user-default-grey.png"),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(AccountPage.route);
                },
              ),
              new SizedBox(
                width: 5.0,
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
      ],
    );
  }
}
