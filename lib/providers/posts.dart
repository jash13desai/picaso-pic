import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:insta_ui_only/models/post.dart';

class Posts with ChangeNotifier {
  bool isInit = true;
  final _auth = FirebaseAuth.instance;
  final List<Post> _posts = [];

  List<Post> get posts {
    print(_posts);
    return _posts..sort((a, b) => a.date.compareTo(b.date));
  }

  void fetchAndSetPosts() {
    final allPosts = FirebaseFirestore.instance
        .collection('posts')
        .where('addedBy', isNotEqualTo: _auth.currentUser.uid);
    try {
      allPosts.get().then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          _posts.add(Post(
            postUrl: doc['imageUrl'],
            location: doc['location'],
            caption: doc['caption'],
            date: DateTime.parse(doc['timeStamp'].toDate().toString()),
            name: doc['addedBy'],
            profileUrl: doc['profileUrl'],
          ));
        });
      });
    } catch (error) {
      print(error);
    }

    if (isInit) {
      isInit = false;
    } else {
      notifyListeners();
    }
  }
}
