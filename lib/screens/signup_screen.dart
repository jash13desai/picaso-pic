import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/textfield_widget.dart';
import 'package:insta_ui_only/globals/globals.dart';
import '../main.dart';
import '../globals/myColors.dart';
import 'homeBar_screen.dart';
import 'intro_screen.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  static const route = '/signup_screen';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _username, _email, _password, _finalPassword;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? kWhite
              : kBlack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 50, 0, 30),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          IntroPage.route, (route) => true);
                    },
                  ),
                )
              ],
            ),
            Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.065),
                  child: Image(
                    width: MediaQuery.of(context).size.width * 0.5,
                    image: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? AssetImage('assets/images/insta_logo_light.jpg')
                        : AssetImage('assets/images/insta_logo_dark.jpg'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFieldWidget(
                    isEmailAddress: true,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    hintText: 'Email',
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0120),
                  TextFieldWidget(
                    isEmailAddress: false,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    obscureText: false,
                    hintText: 'Username',
                    prefixIconData: Icons.verified_user,
                    onChanged: (value) {
                      setState(() {
                        _username = value.trim();
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0120),
                  TextFieldWidget(
                    isEmailAddress: false,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    obscureText: true,
                    hintText: 'Password',
                    prefixIconData: Icons.lock_outline,
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0120),
                  TextFieldWidget(
                    isEmailAddress: false,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    obscureText: true,
                    hintText: 'Confirm Password',
                    prefixIconData: Icons.lock_outline,
                    onChanged: (value) {
                      setState(() {
                        _finalPassword = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) => Center(
                child: GestureDetector(
                  onTap: () async {
                    // await Firebase.initializeApp();
                    auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => InstaHome()),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => InstaHome()),
                    // );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.fromBorderSide(BorderSide.none),
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Global.white,
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
            Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                MediaQuery.of(context).size.height * 0.112,
                0,
                MediaQuery.of(context).size.height * 0.04,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 1,
                    color: kGrey.withOpacity(0.3),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      color: kGrey.withOpacity(0.9),
                      fontSize: 10,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 1,
                    color: kGrey.withOpacity(0.3),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have account?',
                    style: TextStyle(
                      color: kGrey.withOpacity(0.9),
                    ),
                  ),
                  TextSpan(
                    text: ' Log In.',
                    style: TextStyle(color: kBlue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogIn()),
                        );
                      },
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.18),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: kGrey.withOpacity(0.3),
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Instagram ',
                    style: TextStyle(
                      color: kGrey.withOpacity(0.95),
                      fontSize: 9,
                    ),
                  ),
                  Text(
                    'OT ',
                    style: TextStyle(
                      color: kGrey.withOpacity(0.95),
                      fontSize: 7,
                    ),
                  ),
                  Text(
                    'Facebook ',
                    style: TextStyle(
                      color: kGrey.withOpacity(0.95),
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
