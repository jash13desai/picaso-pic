import 'package:flutter/material.dart';
import 'package:insta_ui_only/mySpaces.dart';
import 'package:insta_ui_only/myColors.dart';
import 'package:insta_ui_only/screens/login_screen.dart';

class ActivityWidget extends StatefulWidget {
  final double widgetHeight;
  final bool isLikeOrComment;
  final double whichOne;
  final AssetImage accountImage;
  final String accountName;
  final AssetImage sideImage;
  final String time;

  ActivityWidget({
    required this.widgetHeight,
    required this.whichOne,
    required this.isLikeOrComment,
    required this.accountImage,
    required this.accountName,
    required this.sideImage,
    required this.time,
  });
  @override
  _ActivityWidgetState createState() => _ActivityWidgetState();
}
// #01 -- whichOne is for whether to show the 'Liked/Commented widget' or to show the other one ('Message' button or 'Follow' button) --
//        0 = Liked/Commented Widget -- 1.1 = Message Button && 1.2 = Follow Button !
//  #02 -- isLikeOrComment is used to make the widget a 'liked post' or a 'commented post' -- 'true = 'liked post' and vice-versa !

class _ActivityWidgetState extends State<ActivityWidget> {
  Widget build(BuildContext context) {
    return Container(
      height: widget.widgetHeight,
      width: MediaQuery.of(context).size.width,
      child: widget.whichOne == 0
          ? Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      height: 35,
                      width: 35,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: widget.accountImage,
                        ),
                      ),
                    ),
                    MySpaces.hGapInBetween,
                    Text(widget.accountName),
                    Text(
                      widget.isLikeOrComment
                          ? " liked your photo. "
                          : " commented on your photo. ",
                    ),
                    Text(
                      widget.time,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  height: 20,
                  width: 20,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: widget.sideImage,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8.0),
                      height: 35,
                      width: 35,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: widget.accountImage,
                        ),
                      ),
                    ),
                    MySpaces.hGapInBetween,
                    Text(widget.accountName),
                    Text(" started following\ you. "),
                    Text(
                      widget.time,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (ctx) => Center(
                    child: widget.whichOne == 1.1
                        ? GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => LogIn()),
                              // );
                              createAlertDialog(context).then(
                                (onValue) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Sorry for the feature-less UI :(',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.light
                                        ? kWhite
                                        : kBlack,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey.shade700,
                                  width: 1,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      'Message',
                                      style: TextStyle(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? kWhite
                                            : kBlack,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => LogIn()),
                              // );

                              createAlertDialog(context).then(
                                (onValue) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Sorry for the feature-less UI :(',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.fromBorderSide(BorderSide.none),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      'Follow',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}
