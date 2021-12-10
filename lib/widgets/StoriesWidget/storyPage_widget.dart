import 'dart:async';

import 'package:flutter/material.dart';
import '/widgets/StoriesWidget/MyStoryPages/myStory1.dart';
import '/widgets/StoriesWidget/MyStoryPages/myStory3.dart';
import '/widgets/StoriesWidget/MyStoryPages/myStroy2.dart';
import '/widgets/StoriesWidget/WidgetUtils/storyBars.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currStoryIndex = 0;

  final List<Widget> stories = [
    MyStory1(),
    MyStory2(),
    MyStory3(),
  ];
  final List<double> storyTimer = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < stories.length; i++) {
      storyTimer.add(0);
    }
    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(
      Duration(milliseconds: 50),
      (timer) {
        setState(() {
          if (storyTimer[currStoryIndex] + 0.01 < 1) {
            storyTimer[currStoryIndex] += 0.01;
          } else {
            storyTimer[currStoryIndex] = 1;
            timer.cancel();
            //
            if (currStoryIndex < stories.length - 1) {
              currStoryIndex++;
              _startWatching();
            } else if (currStoryIndex == stories.length - 1) {
              Navigator.pop(context);
            }
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          storyTimer[currStoryIndex] = 1;
        });
      },
      child: Scaffold(
        body: Stack(
          children: [
            // the individual story page list.
            stories[currStoryIndex],
            // the progress bar.
            StoryBars(storyTimer: storyTimer),
          ],
        ),
      ),
    );
  }
}
