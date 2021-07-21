import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/activity_widget.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ActivityWidget(
        whichOne: 1.1,
        accountImage: AssetImage("assets/image/labyrinth.jpg"),
        accountName: "snerz",
        isLikeOrComment: true,
        sideImage: Image.asset("assets/image/spidy.jpg"),
        time: "3m",
      ),
    );
  }
}
