import 'package:insta_ui_only/models/user.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/dm_widget.dart';
// import 'package:instagram_ui_clone/screens/search.dart';

import '../models/post.dart';
import '../models/story.dart';

class DummyData {
  final tab = TabBar(tabs: <Tab>[
    new Tab(icon: new Icon(Icons.arrow_forward)),
    new Tab(icon: new Icon(Icons.arrow_downward)),
    new Tab(icon: new Icon(Icons.arrow_back)),
  ]);

  User get currentUser {
    return User(
      displayname: "User Name",
      imageUrl: "assets/images/labyrinth.jpg",
      userName: "_jade13._",
      postNum: 5,
      followers: 1024,
      following: 102,
      bio: "Bio line 1 \nBio Line 2",
      userPosts: List.generate(10, (index) => "assets/images/labyrinth.jpg"),
    );
  }

  final List<Story> stories = [
    Story(
      userName: "Your Story",
      imageUrl: "assets/images/labyrinth.jpg",
    ),
  ];

  final List<String> searchImages =
      List.generate(100, (index) => "assets/images/labyrinth.jpg");
}
