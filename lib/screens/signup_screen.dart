import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta_ui_only/providers/authentication.dart';
import 'package:insta_ui_only/widgets/textfield_widget.dart';
import 'package:insta_ui_only/globals/globals.dart';
import 'package:provider/provider.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  var isLoading = false;

  String _username, _email, _password, _finalPassword;

  void trySignIn() async {
    if (!_formKey.currentState.validate()) {
      return null;
    }
    setState(() {
      isLoading = true;
    });

    _formKey.currentState.save();
    final authInstance = Provider.of<Authentication>(context, listen: false);

    try {
      await authInstance.signUp(_username, _email, _password);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(InstaHome.route, (route) => false);
    } catch (e) {
      authInstance.showError(e.toString(), context);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? kWhite
              : kBlack,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.pink.shade300,
                backgroundColor: Colors.pink.shade300,
              ),
            )
          : SingleChildScrollView(
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
                            Navigator.pop(context, true);
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
                  Form(
                    key: _formKey,
                    child: Padding(
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
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter your email!";
                              }
                              if (!value.contains("@") ||
                                  !value.contains(".")) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0120),
                          TextFieldWidget(
                            isEmailAddress: false,
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.9,
                            obscureText: false,
                            hintText: 'Username',
                            prefixIconData: Icons.verified_user,
                            onChanged: (value) {
                              setState(() {
                                _username = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter your username";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0120),
                          TextFieldWidget(
                            isEmailAddress: false,
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.9,
                            obscureText: true,
                            hintText: 'Password',
                            prefixIconData: Icons.lock_outline,
                            controller: _passwordController,
                            onFieldSubmitted: (value) {
                              _passwordController.text = value;
                            },
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter a password";
                              }
                              if (value.length < 6) {
                                return "Please enter a password greator than 6 characters";
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0120),
                          TextFieldWidget(
                            isEmailAddress: false,
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.9,
                            obscureText: true,
                            hintText: 'Confirm Password',
                            prefixIconData: Icons.lock_outline,
                            // onChanged: (value) {
                            //   setState(() {
                            //     _finalPassword = value;
                            //   });
                            // },
                            validator: (value) {
                              _finalPassword = value;
                              if (_finalPassword.isEmpty) {
                                return "Please enter your password again";
                              }
                              if (_finalPassword != _passwordController.text) {
                                return "Passwords do not match";
                              }

                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Center(
                      child: GestureDetector(
                        onTap: () async {
                          trySignIn();
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
                            ..onTap = () => Navigator.of(context)
                                .popAndPushNamed(LogIn.route),
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
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.03),
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
