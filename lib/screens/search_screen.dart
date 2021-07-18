import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_ui_only/myColors.dart';
import 'package:insta_ui_only/myFonts.dart';
import 'package:insta_ui_only/mySpaces.dart';
import 'package:insta_ui_only/sizeConfig.dart';
import 'package:insta_ui_only/providers/misc_data.dart';
import 'package:insta_ui_only/widgets/searchbar_widget.dart';

class SearchPage extends StatelessWidget {
  final data = DummyData();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? kBlack
                : kWhite,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    50,
                    0,
                    50,
                  ),
                  child: SearchBar(),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...["IGTV", "Shop", "Style", "Sports", "Auto", "Random"]
                          .map((text) {
                        return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                backgroundColor:
                                    MediaQuery.of(context).platformBrightness ==
                                            Brightness.light
                                        ? kBlack
                                        : kWhite,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: kGrey.withOpacity(0.5), width: 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                text,
                                style: MyFonts.medium
                                    .setColor(
                                      MediaQuery.of(context)
                                                  .platformBrightness ==
                                              Brightness.light
                                          ? kBlack
                                          : kWhite,
                                    )
                                    .size(SizeConfig.horizontalBlockSize * 4),
                              )),
                        );
                      }).toList()
                    ],
                  ),
                ),
                MySpaces.vGapInBetween,
                StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  itemCount: data.searchImages.length,
                  itemBuilder: (context, index) =>
                      Image.asset(data.searchImages[index]),
                  staggeredTileBuilder: (index) => StaggeredTile.count(
                      (index % 10 == 0) ? 2 : 1, (index % 10 == 0) ? 2 : 1),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                )
              ],
            )),
      ),
    );
  }
}
