import 'package:flutter/material.dart';
import 'package:insta_ui_only/providers/posts.dart';
import 'package:insta_ui_only/widgets/ActivityWidgets/activity_widget1.dart';
import 'package:insta_ui_only/widgets/ActivityWidgets/activity_widget2.dart';
import 'package:insta_ui_only/widgets/BottomNavBar/bottomNavBar_main.dart';
import 'package:provider/provider.dart';

// the activity page screen --

class ActivityPage extends StatelessWidget {
  static const route = '/activity_screen';
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
      body: RefreshIndicator(
        color: Colors.pink,
        onRefresh: () async {
          Provider.of<Posts>(context, listen: false);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              ActivityWidget1(widgetTitle: "This Week"),
              ActivityWidget2(widgetTitle: "This Month"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarMain(),
    );
  }
}
