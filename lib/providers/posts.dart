import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/models/post.dart';

class Posts with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final List<Post> _posts = [];
  List<Post> get posts {
    if (_posts.isEmpty) {
      oneTimeFetch().then((_) {
        return _posts..sort((a, b) => b.date.compareTo(a.date));
      });
    }
    return _posts..sort((a, b) => a.date.compareTo(b.date));
  }

  Future<void> fetchPosts() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('posts')
          .where('addedBy', isNotEqualTo: _auth.currentUser.displayName)
          .get();
      _posts.clear();
      response.docs.forEach((doc) {
        _posts.add(Post(
          postUrl: doc['imageUrl'],
          location: doc['location'],
          caption: doc['caption'],
          date: DateTime.parse(doc['timeStamp'].toDate().toString()),
          name: doc['addedBy'],
          profileUrl: doc['profileUrl'],
        ));
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> oneTimeFetch() async {
    await fetchPosts();
  }

  Future<void> fetchAndSetPosts() async {
    await fetchPosts();
    notifyListeners();
  }
}
//   void fetchAndSetPosts() try {
//     final allPosts = FirebaseFirestore.instance
//         .collection('posts')
//         .where('addedBy', isNotEqualTo: _auth.currentUser.uid);
//     try {
//       allPosts.get().then((QuerySnapshot querySnapshot) {
//         querySnapshot.docs.forEach((doc) {
//           _posts.add(Post(
//             postUrl: doc['imageUrl'],
//             location: doc['location'],
//             caption: doc['caption'],
//             date: DateTime.parse(doc['timeStamp'].toDate().toString()),
//             name: doc['addedBy'],
//             profileUrl: doc['profileUrl'],
//           ));
//         });
//       });
//     } catch (error) {
//       print(error);
//     }

//     if (isInit) {
//       isInit = false;
//     } else {
//       notifyListeners();
//     }
//   }
// }
