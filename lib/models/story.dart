import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals/myColors.dart';

class Story extends StatelessWidget {
  final String imageUrl;
  final double radii;

  Story({this.imageUrl, this.radii});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 1,
            color: storyColor,
          )),
      child: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
        radius: radii,
      ),
    );
  }
}
