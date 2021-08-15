import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'package:insta_ui_only/providers/authentication.dart';

import 'package:insta_ui_only/widgets/PostWidget/profilePhoto_widget.dart';
import 'package:provider/provider.dart';
import 'account_screen.dart';

// edit profile page  ----

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
  final _formKey = GlobalKey<FormState>();

// @override
//   void initState() {
//     isLikePressed = widget.post.likedBy
//         .contains(FirebaseAuth.instance.currentUser.displayName);
//     widget.post.addedBy.get().then(
//       (response) {
//         final data = response.data() as Map<String, dynamic>;
//         profileUrl = data['imageUrl'];
//         name = data['user_name'];
//         userId = data['userId'];
//         setState(
//           () {
//             isLoading = false;
//           },
//         );
//       },
//     );

//     super.initState();
//   }

  changeName() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text("Edit Name"),
          content: TextFormField(
            // controller: _nameController,
            onChanged: (value) {
              _userName = value;
            },
            decoration: InputDecoration(
              labelText: "Enter your name",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                Navigator.of(context).pop();
                await Provider.of<Authentication>(context, listen: false)
                    .changeName(_userName, context);
                setState(() {
                  isLoading = false;
                });
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
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
              Navigator.of(context).pushReplacementNamed(AccountPage.route);
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
                  onPressed: () => {},
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
                ? Center(child: CircularProgressIndicator(color: Colors.pink))
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
                            labelText: "Name",
                            prefixIcon: Icon(Icons.account_box),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            // changeName();
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
                            labelText: "Username",
                            prefixIcon: Icon(
                              Icons.text_fields,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {
                            // _location = value;
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
                            labelText: "Website",
                            prefixIcon: Icon(
                              Icons.work_outlined,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onSaved: (value) {},
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
                            // _location = value;
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
