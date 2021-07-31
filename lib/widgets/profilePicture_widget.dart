import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../globals/sizeConfig.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatefulWidget {
  @override
  _ProfilePictureState createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File _imageFile;
  final _auth = FirebaseAuth.instance;
  var isLoading = false;
  final picker = ImagePicker();

  final DocumentReference _db = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser.uid);

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        _imageFile = File(pickedFile.path);
        isLoading = true;
      },
    );

    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('images/${_auth.currentUser.uid}/profile_pic');
    final uploadTask = firebaseStorageRef.putFile(_imageFile);

    uploadTask.then(
      (taskSnapshot) {
        taskSnapshot.ref.getDownloadURL().then(
          (value) async {
            try {
              await _auth.currentUser.updatePhotoURL(value);
              await _db.update({'imageUrl': value});
            } catch (e) {
              print(e);
            }
            setState(
              () {
                isLoading = false;
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: isLoading
          ? CircularProgressIndicator(color: Colors.pink)
          : CircleAvatar(
              radius: SizeConfig.horizontalBlockSize * 11,
              backgroundImage: NetworkImage(
                FirebaseAuth.instance.currentUser.photoURL ??
                    "https://i2.wp.com/wilkinsonschool.org/wp-content/uploads/2018/10/user-default-grey.png",
              ),
            ),
    );
  }
}
