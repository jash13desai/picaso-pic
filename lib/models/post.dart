import 'package:flutter/foundation.dart';
import 'package:insta_ui_only/models/user.dart';
// import 'package:instagram_ui_clone/models/user.dart';

class Post {
  final String profileUrl;
  final String postUrl;
  final String location;
  final String name;
  final String caption;
  final String date;
  final List<User> likedby;

  Post({
    required this.profileUrl,
    required this.postUrl,
    required this.location,
    required this.name,
    required this.caption,
    required this.date,
    required this.likedby,
  });
}
