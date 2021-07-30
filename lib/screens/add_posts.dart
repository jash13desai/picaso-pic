import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    final CollectionReference _db = FirebaseFirestore.instance
        .collection('users')
        .doc('${FirebaseAuth.instance.currentUser.uid}')
        .collection('posts');
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
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black,
        title: Text(
          "New Post",
          style: MyFonts.bold,
        ),
        actions: [
          IconButton(
            onPressed: () => save(imageUrl),
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(
                          top: 8,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "Add Caption"),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            _caption = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  MySpaces.vGapInBetween,
                  TextFormField(
                    decoration: InputDecoration(labelText: "Add Location"),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    onSaved: (value) {
                      _location = value;
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
