import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'package:insta_ui_only/widgets/PostWidget/profilePhoto_widget.dart';
import 'account_screen.dart';

// edit profile page  -- update your username, bio, and profile photo on this page

class EditProfile extends StatefulWidget {
  static const route = '/edit_screen';

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  String imageUrl;
  String _userName;
  String _bio;
  final _formKey = GlobalKey<FormState>();

  void save() async {
    _formKey.currentState.save();
    print(_bio);
    print(_userName);
    setState(() {
      isLoading = true;
    });
    print('isLoading: $isLoading');
    final _db = FirebaseFirestore.instance;
    if (_userName.isNotEmpty) {
      await _db
          .collection('users')
          .doc(_auth.currentUser.uid)
          .update({'user_name': _userName});
    }
    if (_bio.isNotEmpty) {
      await _db
          .collection('users')
          .doc(_auth.currentUser.uid)
          .update({'bio': _bio});
    }
    setState(() {
      isLoading = false;
    });
    Navigator.of(context).pop();
    print('isLoading: $isLoading');
    Navigator.of(context).pop();
    // Navigator.of(context).pushReplacementNamed(
    // AccountPage.route,
    // arguments: _auth.currentUser.uid,
    // );
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed(
              // AccountPage.route,
              // arguments: FirebaseAuth.instance.currentUser.uid,
              // );
            },
          ),
          backgroundColor:
              MediaQuery.of(context).platformBrightness == Brightness.light
                  ? Colors.white
                  : Colors.black,
          title: Text(
            "Edit Profile",
            style: MyFonts.bold,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.pink.shade200,
                child: IconButton(
                  onPressed: () => save(),
                  icon: Icon(Icons.check_rounded),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: isLoading
                ? Container(
                    height: 300,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.pink),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProfilePhoto(),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Change Profile Photo',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 22,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = null,
                            ),
                          ],
                        ),
                      ),
                      MySpaces.vGapInBetween,
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 20, right: 20, left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Username",
                            prefixIcon: Icon(Icons.account_box),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            _userName = value;
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
                            labelText: "Bio",
                            prefixIcon: Icon(Icons.album_outlined),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            _bio = value;
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
