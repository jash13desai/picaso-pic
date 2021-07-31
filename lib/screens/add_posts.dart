import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'homeBar_screen.dart';

class AddPosts extends StatefulWidget {
  static const route = '/add_post';

  @override
  _AddPostsState createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  String _caption, _location;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void save(String imageUrl) async {
    _formKey.currentState.save();
    final CollectionReference _db =
        FirebaseFirestore.instance.collection('posts');
    setState(() {
      isLoading = true;
    });
    try {
      await _db.add({
        'imageUrl': imageUrl,
        'caption': _caption,
        'location': _location,
        'addedBy': FirebaseAuth.instance.currentUser.displayName,
        'profileUrl': FirebaseAuth.instance.currentUser.photoURL,
        'timeStamp': DateTime.now(),
      });
    } catch (error) {
      print(error);
    }

    setState(() {
      isLoading = true;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
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
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )
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
                        child: Flexible(
                          fit: FlexFit.tight,
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 20, right: 20, left: 20),
                    child: Expanded(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 20, right: 20, left: 20),
                    child: Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Add Location",
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onSaved: (value) {
                          _caption = value;
                        },
                      ),
                    ),
                  ),
                  // Container(
                  //   child: Text('$timeStamp'),
                  // )
                ],
              ),
      ),
    );
  }
}
