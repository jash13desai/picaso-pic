import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_ui_only/globals/myColors.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'package:insta_ui_only/globals/sizeConfig.dart';
import 'package:insta_ui_only/providers/posts.dart';
import 'package:insta_ui_only/providers/search_provider.dart';
import 'package:insta_ui_only/widgets/bottomNavBar_main.dart';
import 'package:provider/provider.dart';
import 'homeBar_screen.dart';
import 'package:insta_ui_only/functions/upload_image.dart' as imageUpload;

class SearchPage extends StatefulWidget {
  static const route = '/search_screen';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearching = false;
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    setState(
      () {
        isSearching = true;
      },
    );
    if (value.length == 0) {
      setState(
        () {
          queryResultSet = [];
          tempSearchStore = [];
        },
      );
    }

    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then(
        (QuerySnapshot docs) {
          print(docs.docs);
          for (int i = 0; i < docs.docs.length; ++i) {
            queryResultSet.add(
              docs.docs[i].data(),
            );
            setState(
              () {
                tempSearchStore.add(queryResultSet[i]);
              },
            );
          }
        },
      );
    } else {
      tempSearchStore = [];
      queryResultSet.forEach(
        (element) {
          if (element['user_name']
                  .toLowerCase()
                  .contains(value.toLowerCase()) ==
              true) {
            if (element['user_name']
                    .toLowerCase()
                    .indexOf(value.toLowerCase()) ==
                0) {
              setState(
                () {
                  tempSearchStore.add(element);
                },
              );
            }
          }
        },
      );
    }
    if (tempSearchStore.length == 0 && value.length > 1) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Posts>(context).posts;
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
      body: RefreshIndicator(
        color: Colors.pink,
        onRefresh: () async {
          await Provider.of<Posts>(context, listen: false).fetchAndSetPosts();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  child: Container(
                    height: 50,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            20,
                            0,
                            5,
                          ),
                          child: Container(
                            height: 45,
                            width: SizeConfig.verticalBlockSize * 80,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: isSearching
                                    ? IconButton(
                                        // color: Colors.white,
                                        color: Colors.grey.shade100,
                                        icon: Icon(Icons.arrow_back),
                                        iconSize: 20.0,
                                        onPressed: () {
                                          setState(
                                            () {
                                              isSearching = false;
                                            },
                                          );
                                        },
                                      )
                                    : IconButton(
                                        // color: Colors.white,
                                        color: Colors.grey.shade100,
                                        icon: Icon(Icons.search),
                                        iconSize: 20.0,
                                        onPressed: () {
                                          setState(
                                            () {
                                              isSearching = false;
                                            },
                                          );
                                        },
                                      ),
                                hintText: "Search",
                                hintStyle: MyFonts.light
                                    .setColor(Colors.grey)
                                    .size(SizeConfig.horizontalBlockSize * 5),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 15),
                                fillColor: Colors.grey.shade100,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade900,
                                    width: 1,
                                  ),
                                ),
                              ),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              style: MyFonts.light.setColor(kWhite),
                              onChanged: (val) {
                                initiateSearch(val);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.08),
              SingleChildScrollView(
                child: isSearching
                    ? SingleChildScrollView(
                        child: Column(
                          children: tempSearchStore.map((element) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(element['imageUrl']),
                              ),
                              title: Text(element['user_name']),
                            );
                          }).toList(),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                            // color: appbarColor,
                            child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...[
                                    "IGTV",
                                    "Shop",
                                    "Style",
                                    "Sports",
                                    "Auto",
                                    "Random"
                                  ].map(
                                    (text) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 9, vertical: 3),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            // backgroundColor: kBlack,
                                            backgroundColor: MediaQuery.of(
                                                            context)
                                                        .platformBrightness ==
                                                    Brightness.light
                                                ? kWhite
                                                : kBlack,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: kGrey.withOpacity(1),
                                                  width: 1.3),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            text,
                                            style: TextStyle(
                                              color: MediaQuery.of(context)
                                                          .platformBrightness ==
                                                      Brightness.light
                                                  ? kBlack
                                                  : kWhite,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList()
                                ],
                              ),
                            ),
                            MySpaces.vGapInBetween,
                            StaggeredGridView.countBuilder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              itemCount: data.length,
                              itemBuilder: (ctx, index) => Image.network(
                                data[index].postUrl,
                                fit: BoxFit.cover,
                              ),
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.count((index % 10 == 0) ? 2 : 1,
                                      (index % 10 == 0) ? 2 : 1),
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                            )
                          ],
                        )),
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarMain(),
    );
  }
}
