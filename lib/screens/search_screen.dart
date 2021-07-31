import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_ui_only/globals/myColors.dart';
import 'package:insta_ui_only/providers/misc_data.dart';
import 'package:insta_ui_only/screens/search_index0.dart';
import 'account_screen.dart';
import 'activity_screen.dart';
import 'homeBar_screen.dart';
import 'package:insta_ui_only/functions/upload_image.dart' as imageUpload;

class SearchPage extends StatelessWidget {
  static const route = '/search_screen';

  final User data = MyUserData().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? Colors.white
                : Colors.black,
        actionsIconTheme: IconThemeData(
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? kBlack
              : kWhite,
        ),
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(
          // Navigator.of(context).pushReplacementNamed(InstaHome.route);
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(InstaHome.route);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? kBlack
                : kWhite,
          ),
        ),
        title: SizedBox(
          height: 35.0,
          child: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Image.asset("assets/images/insta_logo_light.jpg")
              : Image.asset("assets/images/insta_logo_dark.jpg"),
        ),
        actions: [
          IconButton(
            onPressed: () => imageUpload.navigate(),
            icon: MediaQuery.of(context).platformBrightness == Brightness.light
                ? Image.asset("assets/icons/scan_light.jpg")
                : Image.asset("assets/icons/scan_dark.jpg"),
            iconSize: 5,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => index == 0
            ? SizedBox(
                child: SearchIndex0(),
                height: MediaQuery.of(context).size.height * 0.15)
            : StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                itemCount: 40,
                itemBuilder: (ctx, index) => Image.asset(
                  data.userPosts[index],
                  fit: BoxFit.cover,
                ),
                staggeredTileBuilder: (index) => StaggeredTile.count(
                  (index % 10 == 0) ? 2 : 1,
                  (index % 10 == 0) ? 2 : 1,
                ),
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
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
                  Navigator.of(context).pushReplacementNamed(InstaHome.route);
                },
              ),
              IconButton(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black
                    : Colors.white,
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(SearchPage.route);
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
                    : Colors.grey.shade700,
                icon: Icon(FontAwesomeIcons.heart),
                iconSize: 20,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(ActivityPage.route);
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
                  Navigator.of(context).pushReplacementNamed(AccountPage.route);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
