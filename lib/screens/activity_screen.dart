import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/activity_widget.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          ActivityWidget(
            widgetHeight: 50,
            whichOne: 1.2,
            accountImage: AssetImage("assets/image/labyrinth.jpg"),
            accountName: "snerz",
            isLikeOrComment: true,
            sideImage: Image.asset("assets/image/spidy.jpg"),
            time: "3m",
          ),
        ],
      ),
    );
  }
}
