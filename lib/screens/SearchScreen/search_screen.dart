import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:insta_ui_only/globals/myFonts.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_ui_only/providers/posts.dart';
import 'package:insta_ui_only/providers/search_provider.dart';
import '../MainPageScreen_Feeds/homeBar_screen.dart';
import 'package:insta_ui_only/widgets/BottomNavBar/bottomNavBar_main.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatefulWidget {
  static const route = '/search_screen';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isSearching = false;
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearchFunction(value) {
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
            queryResultSet.add(docs.docs[i].data());
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
              ? Colors.black
              : Colors.white,
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
                ? Colors.black
                : Colors.white,
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
      body: RefreshIndicator(
        color: Colors.pink,
        onRefresh: () async {
          await Provider.of<Posts>(context, listen: false).fetchAndSetPosts();
        },
        child: SingleChildScrollView(
          child: RefreshIndicator(
            color: Colors.pink,
            onRefresh: () async {
              await Provider.of<Posts>(context, listen: false)
                  .fetchAndSetPosts();
            },
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: isSearching
                                  ? IconButton(
                                      icon: Icon(Icons.arrow_back),
                                      iconSize: 20.0,
                                      // color: kGrey,
                                      color: Colors.grey[700],
                                      onPressed: () {
                                        setState(
                                          () {
                                            isSearching = false;
                                          },
                                        );
                                      },
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.search),
                                      iconSize: 20.0,
                                      // color: kGrey,
                                      color: Colors.grey.shade700,
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
                                  .setColor(Colors.grey.shade500)
                                  .size(18),
                              filled: true,
                              focusColor: Colors.grey,
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
                            style: MyFonts.light
                                .setColor(
                                  Colors.grey[700],
                                )
                                .size(20),
                            onChanged: (val) {
                              initiateSearchFunction(val);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RefreshIndicator(
                  color: Colors.pink,
                  onRefresh: () async {
                    await Provider.of<Posts>(context, listen: false)
                        .fetchAndSetPosts();
                  },
                  child: SingleChildScrollView(
                    child: isSearching
                        ? SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                              child: Column(
                                children: tempSearchStore.map(
                                  (element) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(element['imageUrl']),
                                      ),
                                      title: Text(
                                        element['user_name'],
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          )
                        : Container(
                            child: Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...[
                                        "IGTV",
                                        "Sports",
                                        "Style",
                                        "Shop",
                                        "Auto",
                                        "Clothes",
                                        "Nature",
                                        "Food"
                                      ].map(
                                        (text) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 9, vertical: 3),
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                backgroundColor: MediaQuery.of(
                                                                context)
                                                            .platformBrightness ==
                                                        Brightness.light
                                                    ? Colors.white
                                                    : Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: Colors.grey[700]
                                                          .withOpacity(1),
                                                      width: 1.3),
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                                      ? Colors.black
                                                      : Colors.white,
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
                                      StaggeredTile.count(
                                          (index % 10 == 0) ? 2 : 1,
                                          (index % 10 == 0) ? 2 : 1),
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4,
                                )
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarMain(),
    );
  }
}
