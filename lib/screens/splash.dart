import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homeBar_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      User result = FirebaseAuth.instance.currentUser;
      if (result != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(InstaHome.route, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
