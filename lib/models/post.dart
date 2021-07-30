import 'package:flutter/foundation.dart';

class Post {
  final String postUrl;
  final String location;
  final String caption;
  final DateTime date;
  final String name;
  final String profileUrl;

  Post({
    @required this.postUrl,
    @required this.location,
    @required this.caption,
    @required this.date,
    @required this.name,
    @required this.profileUrl,
  });
}
