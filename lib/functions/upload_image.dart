import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_ui_only/screens/add_posts.dart';

final _auth = FirebaseAuth.instance;

File _imageFile;
final picker = ImagePicker();

BuildContext context;

void init(BuildContext ctx) {
  context = ctx;
}

Future pickImage(ImageSource uploadMethod) async {
  final pickedFile = await picker.pickImage(source: uploadMethod);
  _imageFile = File(pickedFile.path);

  final firebaseStorageRef =
      FirebaseStorage.instance.ref().child('images/${_auth.currentUser.uid}/');
  final uploadTask = firebaseStorageRef.putFile(_imageFile);

  uploadTask.then((taskSnapshot) {
    taskSnapshot.ref.getDownloadURL().then((value) async {
      try {
        Navigator.of(context).pushNamed(AddPosts.route, arguments: value);
      } catch (error) {
        print(error);
      }
    });
  });
}
