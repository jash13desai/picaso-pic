import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_ui_only/myColors.dart';
import 'package:insta_ui_only/screens/search_index0.dart';
import 'account_screen.dart';
import 'activity_screen.dart';
import 'homeBar_screen.dart';

class SearchPage extends StatelessWidget {
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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => InstaHome()));
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
            onPressed: () => {},
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
                itemBuilder: (context, index) => Image.asset(
                  "assets/images/miles_morales.jpg",
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
                    ? Colors.black
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
                    ? Colors.black
                    : Colors.white,
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
                    ? Colors.black
                    : Colors.grey.shade700,
                icon: Icon(FontAwesomeIcons.heart),
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
                    ? Colors.black
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
//     return Material(
//       child: SingleChildScrollView(
//         child: Container(
//             color: MediaQuery.of(context).platformBrightness == Brightness.light
//                 ? kWhite
//                 : kBlack,
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(
//                     0,
//                     80,
//                     0,
//                     50,
//                   ),
//                   child: SearchBar(),
//                 ),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       ...["IGTV", "Shop", "Style", "Sports", "Auto", "Random"]
//                           .map((text) {
//                         return Container(
//                           color: MediaQuery.of(context).platformBrightness ==
//                                   Brightness.light
//                               ? kWhite
//                               : kBlack,
//                           margin:
//                               EdgeInsets.symmetric(horizontal: 9, vertical: 3),
//                           child: TextButton(
//                               style: TextButton.styleFrom(
//                                 padding: EdgeInsets.symmetric(vertical: 8),
//                                 backgroundColor:
//                                     MediaQuery.of(context).platformBrightness ==
//                                             Brightness.light
//                                         ? kWhite
//                                         : kBlack,
//                                 shape: RoundedRectangleBorder(
//                                   side: BorderSide(
//                                       color: kGrey.withOpacity(0.5), width: 1),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(8),
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () {},
//                               child: Text(
//                                 text,
//                                 style: MyFonts.medium
//                                     .setColor(
//                                       MediaQuery.of(context)
//                                                   .platformBrightness ==
//                                               Brightness.light
//                                           ? kBlack
//                                           : kWhite,
//                                     )
//                                     .size(SizeConfig.horizontalBlockSize * 4),
//                               )),
//                         );
//                       }).toList()
//                     ],
//                   ),
//                 ),
//                 MySpaces.vGapInBetween,
//                 StaggeredGridView.countBuilder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   crossAxisCount: 3,
//                   itemCount: data.searchImages.length,
//                   itemBuilder: (context, index) =>
//                       Image.asset(data.searchImages[index]),
//                   staggeredTileBuilder: (index) => StaggeredTile.count(
//                       (index % 10 == 0) ? 2 : 1, (index % 10 == 0) ? 2 : 1),
//                   mainAxisSpacing: 8.0,
//                   crossAxisSpacing: 8.0,
//                 )
//               ],
//             )),
//       ),
//     );
  }
}
