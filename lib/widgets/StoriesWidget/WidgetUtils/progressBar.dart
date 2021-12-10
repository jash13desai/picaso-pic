// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  double storyTimer = 0;
  ProgressBar({@required this.storyTimer});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 12.5,
      percent: storyTimer,
      progressColor: Colors.white,
    );
  }
}
