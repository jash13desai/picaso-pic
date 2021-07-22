import 'package:flutter/material.dart';
import 'package:insta_ui_only/screens/account_screen.dart';
import 'dm_list_screen.dart';
import 'homeBar_screen.dart';

class DMPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.black
              : Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InstaHome()),
            );
          },
        ),
        title: SizedBox(
          height: 35.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
                icon: Container(
                  // height: MediaQuery.of(context).size.height * 0.3,
                  child: Text(
                    '_jade13._',
                    style: TextStyle(
                      color: MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                iconSize: 77,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 35,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.black
                : Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: DMScrollList(),
      bottomNavigationBar: Container(
        color: MediaQuery.of(context).platformBrightness == Brightness.light
            ? Colors.white
            : Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.055,
        child: BottomAppBar(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.white
              : Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RadiantGradientMask(
                child: Icon(
                  Icons.camera_alt_rounded,
                  size: 35,
                ),
              ),
              Text(
                "  Camera",
                style: TextStyle(
                  color: Colors.blue.shade300,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.topRight,
        radius: 1,
        colors: [Colors.blue.shade800, Colors.blue.shade300],
        tileMode: TileMode.clamp,
      ).createShader(bounds),
      child: child,
    );
  }
}
