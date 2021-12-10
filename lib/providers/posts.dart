import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/models/post.dart';

// post fetching provider used in feeds screen, search screen and account page to fetch realtime posts from the user and to display it!

class Posts with ChangeNotifier {
  List<dynamic> queryList;

  Future<void> fetchFollowingData() async {
    final userFollowingData = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    final List<dynamic> followingList = userFollowingData.data()['following'];
    print(followingList);
    queryList = followingList.map((e) {
      return FirebaseFirestore.instance.doc('users/$e/');
    }).toList();
  }

  List<Post> setViva(List<QueryDocumentSnapshot> documents) {
    List<Post> availablePosts = [];

    documents.forEach((doc) {
      availablePosts.add(
        Post(
          postUrl: doc['imageUrl'],
          location: doc['location'],
          caption: doc['caption'],
          date: DateTime.parse(doc['timeStamp'].toDate().toString()),
          addedBy: doc['addedBy'],
          docId: doc.id,
          likedBy: doc['likedBy'],
        ),
      );
    });
    return availablePosts..sort((a, b) => b.date.compareTo(a.date));
  }
}
