import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/stories_widget.dart';

class InstaStories extends StatelessWidget {
  // final stories = Container(
  //   height: 100,
  //   width: 1000,
  //   child: new ListView.builder(
  //     scrollDirection: Axis.horizontal,
  //     itemCount: 1,
  //     itemBuilder: (context, index) => Stack(
  //       alignment: Alignment.topLeft,
  //       children: <Widget>[
  //         Row(
  //           children: [
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/labyrinth.jpg"),
  //               storyName: 'Your Story',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/tony_stark.jpg"),
  //               storyName: 'tony_stark',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/pet_par.jpg"),
  //               storyName: 'pet_par',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/nat_rom.jpg"),
  //               storyName: 'nat_rom',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/steph_strange.jpg"),
  //               storyName: 'steph_strange',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/ned_leeds.jpg"),
  //               storyName: 'ned_leeds',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/wade_wilson.jpg"),
  //               storyName: 'wade_wilson',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/mich_jon.jpg"),
  //               storyName: 'mich_jon',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/scott_lang.jpg"),
  //               storyName: 'scott_lang',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/steve_rogers.jpg"),
  //               storyName: 'steve_rogers',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/thor.jpg"),
  //               storyName: 'thor_odin',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/loki.jpg"),
  //               storyName: 'just_loki',
  //             ),
  //             StoryWidget(
  //               storyImage: AssetImage("assets/images/miles_morales.jpg"),
  //               storyName: 'miles_morales',
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(12.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 100,
            width: 1000,
            child: new ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) => Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Row(
                    children: [
                      StoryWidget(
                        storyImage: AssetImage("assets/images/labyrinth.jpg"),
                        storyName: 'Your Story',
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/tony_stark.jpg"),
                        storyName: 'tony_stark',
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/pet_par.jpg"),
                        storyName: 'pet_par',
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/nat_rom.jpg"),
                        storyName: 'nat_rom',
                      ),
                      StoryWidget(
                        storyImage:
                            AssetImage("assets/images/steph_strange.jpg"),
                        storyName: 'steph_strange',
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/ned_leeds.jpg"),
                        storyName: 'ned_leeds',
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/wade_wilson.jpg"),
                        storyName: 'wade_wilson',
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/mich_jon.jpg"),
                        storyName: 'mich_jon',
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/scott_lang.jpg"),
                        storyName: 'scott_lang',
                      ),
                      StoryWidget(
                        storyImage:
                            AssetImage("assets/images/steve_rogers.jpg"),
                        storyName: 'steve_rogers',
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/thor.jpg"),
                        storyName: 'thor_odin',
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/loki.jpg"),
                        storyName: 'just_loki',
                      ),
                      StoryWidget(
                        storyImage:
                            AssetImage("assets/images/miles_morales.jpg"),
                        storyName: 'miles_morales',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
