import 'package:flutter/material.dart';
import '/widgets/StoriesWidget/stories_widget.dart';
import '/widgets/StoriesWidget/storyPage_widget.dart';

class InstaStories extends StatefulWidget {
  @override
  State<InstaStories> createState() => _InstaStoriesState();
}

class _InstaStoriesState extends State<InstaStories> {
  void _openStory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.all(12),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 100,
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
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/tony_stark.jpg"),
                        storyName: 'tony_stark',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/pet_par.jpg"),
                        storyName: 'pet_par',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/nat_rom.jpg"),
                        storyName: 'nat_rom',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage:
                            AssetImage("assets/images/steph_strange.jpg"),
                        storyName: 'steph_strange',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/ned_leeds.jpg"),
                        storyName: 'ned_leeds',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/wade_wilson.jpg"),
                        storyName: 'wade_wilson',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/mich_jon.jpg"),
                        storyName: 'mich_jon',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/scott_lang.jpg"),
                        storyName: 'scott_lang',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage:
                            AssetImage("assets/images/steve_rogers.jpg"),
                        storyName: 'steve_rogers',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/thor.jpg"),
                        storyName: 'thor_odin',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage: AssetImage("assets/images/loki.jpg"),
                        storyName: 'just_loki',
                        onTapFunction: _openStory,
                      ),
                      StoryWidget(
                        storyImage:
                            AssetImage("assets/images/miles_morales.jpg"),
                        storyName: 'miles_morales',
                        onTapFunction: _openStory,
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
