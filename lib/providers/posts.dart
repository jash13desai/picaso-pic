import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/models/post.dart';

// post fetching provider used in feeds screen, search screen and account page to fetch realtime posts from the user and to display it!

class Posts with ChangeNotifier {
  // final _auth = FirebaseAuth.instance;
  final List<Post> _posts = [];
  bool isLoading = false;

  List<Post> get posts {
    if (_posts.isEmpty) {
      fetchAndSetPosts().then(
        (_) {
          return _posts..sort((a, b) => b.date.compareTo(a.date));
        },
      );
    }
    return _posts..sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> fetchAndSetPosts() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('posts')
          .where(
            'addedBy',
            isNotEqualTo: FirebaseFirestore.instance.doc(
              '/users/${FirebaseAuth.instance.currentUser.uid}',
            ),
          )
          .get();
      _posts.clear();
      response.docs.forEach(
        (doc) {
          _posts.add(
            Post(
              postUrl: doc['imageUrl'],
              location: doc['location'],
              caption: doc['caption'],
              date: DateTime.parse(doc['timeStamp'].toDate().toString()),
              // name: doc['addedBy'],
              // profileUrl: doc['profileUrl'],
              addedBy: doc['addedBy'],
              likedBy: doc['likedBy'],
              docId: doc.id,
            ),
          );
        },
      );
    } catch (e) {
      throw e;
    }
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
