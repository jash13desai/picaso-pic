import 'package:flutter/material.dart';
import 'activity_tile_widget.dart';

class ActivityWidget extends StatelessWidget {
  final String widgetTitle;
  ActivityWidget({
    required this.widgetTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widgetTitle),
          ActivityTileWidget(
            widgetHeight: 50,
            whichOne: 1.2,
            accountImage: AssetImage("assets/image/labyrinth.jpg"),
            accountName: "snerz",
            isLikeOrComment: true,
            sideImage: AssetImage("assets/image/spidy.jpg"),
            time: "3m",
          ),
        ],
      ),
    );
  }
}
