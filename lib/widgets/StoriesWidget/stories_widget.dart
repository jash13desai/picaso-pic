import 'package:flutter/material.dart';
import 'gradient_ring_widget.dart';

class StoryWidget extends StatelessWidget {
  final AssetImage storyImage;
  final String storyName;
  final onTapFunction;

  StoryWidget({
    @required this.storyImage,
    @required this.storyName,
    this.onTapFunction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        child: Column(
          children: [
            WGradientRing(
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: storyImage,
                    fit: BoxFit.cover,
                  ),
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 1.5,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              storyName,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
