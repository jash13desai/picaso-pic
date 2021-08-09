import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/functions/upload_image.dart';
import 'homeBar_screen.dart';

// uploading the posts screen

class AddPost extends StatefulWidget {
  final ImageSource source;
  static const route = '/add_post';

  const AddPost(this.source);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  File _imageFile;
  bool isLoading = false;
  String imageUrl;
  final picker = ImagePicker();

  Future pickImage() async {
    try {
      final pickedFile = await picker.pickImage(source: widget.source);

      _imageFile = File(pickedFile.path);
    } catch (error) {
      print("ERROR");
      print(error);
      Navigator.of(context).pop();
    }

    setState(() {
      isLoading = true;
    });

    final firebaseStorageRef = FirebaseStorage.instance.ref().child(
        'images/${FirebaseAuth.instance.currentUser.uid}/${DateTime.now().toString()}');
    firebaseStorageRef.putFile(_imageFile).then((taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((value) {
        try {
          imageUrl = value;
        } catch (error) {
          print(error);
        }
        // Stop the loading once fetching and setting it done
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  void initState() {
    pickImage();
    super.initState();
  }

  String _caption, _location;
  final _formKey = GlobalKey<FormState>();
  // bool isLoading = false;

  void save(String imageUrl) async {
    _formKey.currentState.save();
    final CollectionReference _db =
        FirebaseFirestore.instance.collection('posts');
    setState(() {
      isLoading = true;
    });
    try {
      await _db.add(
        {
          'imageUrl': imageUrl,
          'caption': _caption,
          'location': _location,
          // 'addedBy': FirebaseAuth.instance.currentUser.displayName,
          // 'profileUrl': FirebaseAuth.instance.currentUser.photoURL,
          'timeStamp': DateTime.now(),
          'addedBy': FirebaseFirestore.instance
              .doc('/users/${FirebaseAuth.instance.currentUser.uid}'),
        },
      );
    } catch (e) {
      print(e);
    }

    setState(() {
      isLoading = true;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 25,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(InstaHome.route);
            },
          ),
          backgroundColor:
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
          title: Text(
            "Add Post",
            style: MyFonts.bold,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.pink.shade200,
                child: IconButton(
                  onPressed: () => save(imageUrl),
                  icon: Icon(Icons.check_rounded),
                ),
              ),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.pink))
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, right: 20, left: 20),
                        child: Container(
                          height: 200,
                          width: 300,
                          child: Image.network(
                            imageUrl ??
                                "https://i.pinimg.com/564x/d7/22/d9/d722d9b3f8f8ae58d2fd3b4cb9dd657c.jpg",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 20, right: 20, left: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Add Caption",
                          prefixIcon: Icon(Icons.text_fields),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          _caption = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Add Location",
                          prefixIcon: Icon(
                            Icons.location_on,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          _location = value;
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
