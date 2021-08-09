import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';

class ActivityTileWidget extends StatefulWidget {
  bool isLikeOrComment;
  double widgetHeight;
  double whichOne;
  AssetImage accountImage;
  String accountName;
  AssetImage sideImage;
  String time;

  ActivityTileWidget({
    this.widgetHeight,
    this.whichOne,
    this.isLikeOrComment,
    this.accountImage,
    this.accountName,
    this.sideImage,
    this.time,
  });
  @override
  _ActivityTileWidgetState createState() => _ActivityTileWidgetState();
}
// #01 -- whichOne is for whether to show the 'Liked/Commented widget' or to show the other one ('Message' button or 'Follow' button) --
//        0 = Liked/Commented Widget -- 1.1 = Message Button && 1.2 = Follow Button !
//  #02 -- isLikeOrComment is used to make the widget a 'liked post' or a 'commented post' -- 'true = 'liked post' and vice-versa !

class _ActivityTileWidgetState extends State<ActivityTileWidget> {
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.widgetHeight,
      width: MediaQuery.of(context).size.width,
      child: widget.whichOne == 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: widget.accountImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    MySpaces.hGapInBetween,
                    Text(widget.accountName),
                    Text(
                        widget.isLikeOrComment
                            ? " liked your photo. "
                            : " commented on a photo. ",
                        style: TextStyle(fontSize: 13)),
                    Text(
                      widget.time,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    // color: Colors.pink,
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: widget.sideImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        // color: Colors.pink,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: widget.accountImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    MySpaces.hGapInBetween,
                    Text(widget.accountName),
                    Text(" started following you. ",
                        style: TextStyle(fontSize: 13)),
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
                              setState(() {
                                widget.whichOne = 1.2;
                              });
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                color:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.light
                                        ? Colors.white
                                        : Colors.black,
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
                                  width: 70,
                                  child: Center(
                                    child: Text(
                                      'Following',
                                      style: TextStyle(
                                        color: MediaQuery.of(context)
                                                    .platformBrightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black,
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
                              setState(() {
                                widget.whichOne = 1.1;
                              });
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
                                  width: 60,
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
