import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_ui_only/screens/search_screen.dart';
import 'package:insta_ui_only/widgets/activity_widget.dart';

import 'account_screen.dart';
import 'homeBar_screen.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activity',
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey,
            height: 0.8,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 200),
          ActivityWidget(
            widgetHeight: 50,
            whichOne: 1.2,
            accountImage: AssetImage("assets/image/labyrinth.jpg"),
            accountName: "snerz",
            isLikeOrComment: true,
            sideImage: AssetImage("assets/image/spidy.jpg"),
            time: "3m",
          ),
          ActivityWidget(
            widgetHeight: 50,
            whichOne: 1.1,
            accountImage: AssetImage("assets/image/labyrinth.jpg"),
            accountName: "snerz",
            isLikeOrComment: true,
            sideImage: AssetImage("assets/image/spidy.jpg"),
            time: "3m",
          ),
          ActivityWidget(
            widgetHeight: 50,
            whichOne: 0,
            accountImage: AssetImage("assets/image/labyrinth.jpg"),
            accountName: "snerz",
            isLikeOrComment: true,
            sideImage: AssetImage("assets/image/spidy.jpg"),
            time: "3m",
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: MediaQuery.of(context).platformBrightness == Brightness.light
            ? Colors.white
            : Colors.black,
        height: 50.0,
        alignment: Alignment.center,
        child: BottomAppBar(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.white
              : Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.grey.shade700
                    : Colors.grey.shade700,
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InstaHome()),
                  );
                },
              ),
              IconButton(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.grey.shade700
                    : Colors.grey.shade700,
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.add_box,
                ),
                onPressed: null,
              ),
              IconButton(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white,
                icon: Icon(FontAwesomeIcons.solidHeart),
                iconSize: 20,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityPage()),
                  );
                },
              ),
              IconButton(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.grey.shade700
                    : Colors.grey.shade700,
                icon: Icon(
                  Icons.account_box,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
