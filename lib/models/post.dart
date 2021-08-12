import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String postUrl;
  final String location;
  final String caption;
  final DateTime date;
  final DocumentReference addedBy;
  final List likedBy;
  final String docId;

  Post({
    @required this.postUrl,
    @required this.location,
    @required this.caption,
    @required this.date,
    @required this.addedBy,
    @required this.docId,
    @required this.likedBy,
  });
}

  // Post({
  //   this.postUrl,
  //   this.location,
  //   this.caption,
  //   this.date,
  //   this.name,
  //   this.profileUrl,
  // });
