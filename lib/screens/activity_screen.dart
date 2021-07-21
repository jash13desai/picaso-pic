import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_ui_only/screens/search_screen.dart';
import 'package:insta_ui_only/widgets/activity_widget1.dart';
import 'package:insta_ui_only/widgets/activity_widget2.dart';
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
            color: Theme.of(context).colorScheme.onBackground,
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
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Column(
          children: [
            ActivityWidget1(widgetTitle: "This Week"),
            ActivityWidget2(widgetTitle: "This Month"),
          ],
        ),
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
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Icons.home
                      : Icons.home_outlined,
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
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Icons.account_box
                      : Icons.account_box_outlined,
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
