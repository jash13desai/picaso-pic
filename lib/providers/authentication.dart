import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  signUp(String name, String email, String password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        await _auth.currentUser.updateDisplayName(name);
      }
    } catch (e) {
      throw e;
    }
  }

  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw e;
    }
  }

  attachImage(String url) async {
    try {
      await _auth.currentUser.updatePhotoURL("url");
    } catch (e) {
      throw e;
    }
  }

  changeName(String newName, BuildContext context) async {
    try {
      if (newName.isNotEmpty) {
        await _auth.currentUser.updateDisplayName(newName);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Name updated")));
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  showError(String errormessage, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ERROR ENCOUNTERED!'),
          content: Text(errormessage),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'))
          ],
        );
      },
    );
  }
}
