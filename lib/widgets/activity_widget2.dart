import 'package:flutter/material.dart';
import 'package:insta_ui_only/mySpaces.dart';
import 'activity_tile_widget.dart';

class ActivityWidget2 extends StatelessWidget {
  final String widgetTitle;
  ActivityWidget2({required this.widgetTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          30,
          19,
          0,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widgetTitle,
                style: TextStyle(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              MySpaces.vGapInBetween,
              ActivityTileWidget(
                widgetHeight: 50,
                whichOne: 0,
                accountImage: AssetImage("assets/image/labyrinth.jpg"),
                accountName: "snerz",
                isLikeOrComment: true,
                sideImage: AssetImage("assets/image/spidy.jpg"),
                time: "3m",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
