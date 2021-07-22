import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/textfield_widget.dart';
import 'package:insta_ui_only/globals.dart';
import '../main.dart';
import '../myColors.dart';
import 'homeBar_screen.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _username = '', _password = "", _email = "";
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Insta()),
                      );
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
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                    isEmailAddress: true,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    hintText: 'Email',
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0120),
                  TextFieldWidget(
                    onChanged: (value) {
                      setState(() {
                        _username = value.trim();
                      });
                    },
                    isEmailAddress: false,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    obscureText: false,
                    hintText: 'Username',
                    prefixIconData: Icons.verified_user,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0120),
                  TextFieldWidget(
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                    isEmailAddress: false,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    obscureText: true,
                    hintText: 'Password',
                    prefixIconData: Icons.lock_outline,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0120),
                  TextFieldWidget(
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                    isEmailAddress: false,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.9,
                    obscureText: true,
                    hintText: 'Confirm Password',
                    prefixIconData: Icons.lock_outline,
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) => Center(
                child: GestureDetector(
                  onTap: () {
                    auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => InstaHome()),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => InstaHome()),
                    // );
                    // Navigator.of(context).pushReplacementNamed(InstaHome.routeName);
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
