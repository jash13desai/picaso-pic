import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/screens/login_screen.dart';
import 'package:insta_ui_only/screens/signup_screen.dart';
import '../globals/myColors.dart';
import 'homeBar_screen.dart';

class IntroPage extends StatefulWidget {
  static const route = '/intro_screen';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? kWhite
              : kBlack,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Container(
                  child: Center(
                    child: Image(
                      width: MediaQuery.of(context).size.width * 0.6,
                      image: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? AssetImage('assets/images/insta_logo_light.jpg')
                          : AssetImage('assets/images/insta_logo_dark.jpg'),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.185),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) => Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                LogIn.route, (route) => true);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.blue[500],
                              borderRadius: BorderRadius.circular(5),
                              border: Border.fromBorderSide(BorderSide.none),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.056,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Center(
                                  child: Text(
                                    'Log In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.075),
                    Builder(
                      builder: (context) => Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                SignUp.route, (route) => true);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? kWhite
                                      : kBlack,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.blue,
                                width: 1.6,
                              ),
                            ),
                            child: InkWell(
                              splashColor: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.056,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
