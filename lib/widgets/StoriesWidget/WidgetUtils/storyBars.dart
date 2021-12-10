// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/StoriesWidget/WidgetUtils/progressBar.dart';

class StoryBars extends StatelessWidget {
  List<double> storyTimer;
  StoryBars({@required this.storyTimer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        children: [
          Expanded(
            child: ProgressBar(
              storyTimer: storyTimer[0],
            ),
          ),
          Expanded(
            child: ProgressBar(
              storyTimer: storyTimer[1],
            ),
          ),
          Expanded(
            child: ProgressBar(
              storyTimer: storyTimer[2],
            ),
          ),
        ],
      ),
    );
  }
}
