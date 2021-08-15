import 'package:flutter/material.dart';

import 'StoriesWidget/gradient_ring_widget.dart';
import 'iconGradient.dart';

class CaughtUp extends StatelessWidget {
  // const CaughtUp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: WGradientRing(
              width: 4,
              padding: 15,
              child: GradientIcon(
                Icons.check,
                55,
                LinearGradient(
                  colors: <Color>[
                    Colors.purple,
                    Colors.orange,
                    Colors.purple,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "You're All Caught Up",
              style: TextStyle(
                fontSize: 25,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              "You've seen all new posts from the past 3 days.",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                // fontWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RadiantGradientMask2 extends StatelessWidget {
  RadiantGradientMask2({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topRight,
        radius: 1,
        colors: [Colors.purple, Colors.orange, Colors.purple],
        tileMode: TileMode.clamp,
      ).createShader(bounds),
      child: child,
    );
  }
}
