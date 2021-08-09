import 'package:flutter/material.dart';
import 'package:insta_ui_only/globals/mySpaces.dart';
import 'activity_tile_widget.dart';

class ActivityWidget1 extends StatelessWidget {
  final String widgetTitle;
  ActivityWidget1({this.widgetTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          30,
          20,
          0,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widgetTitle,
                style: TextStyle(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              MySpaces.vGapInBetween,
              ActivityTileWidget(
                widgetHeight: 50,
                whichOne: 0,
                accountImage: AssetImage("assets/images/ned_leeds.jpg"),
                accountName: "ned_leeds",
                isLikeOrComment: true,
                sideImage: AssetImage('assets/images/spidy.jpg'),
                time: "1d",
              ),
              MySpaces.vGapInBetween,
              ActivityTileWidget(
                widgetHeight: 50,
                whichOne: 0,
                accountImage: AssetImage("assets/images/mich_jon.jpg"),
                accountName: "mich_jon",
                isLikeOrComment: true,
                sideImage: AssetImage("assets/images/miles_morales.jpg"),
                time: "3d",
              ),
              MySpaces.vGapInBetween,
              ActivityTileWidget(
                widgetHeight: 50,
                whichOne: 0,
                accountImage: AssetImage("assets/images/pet_par.jpg"),
                accountName: "pet_par",
                isLikeOrComment: false,
                sideImage: AssetImage("assets/images/tony_stark_post.jpg"),
                time: "3d",
              ),
              MySpaces.vGapInBetween,
              ActivityTileWidget(
                widgetHeight: 50,
                whichOne: 1.1,
                accountImage: AssetImage("assets/images/nat_rom.jpg"),
                accountName: "nat_rom",
                isLikeOrComment: false,
                sideImage: AssetImage("assets/images/nat_rom_post.jpg"),
                time: "4d",
              ),
              MySpaces.vGapInBetween,
              ActivityTileWidget(
                widgetHeight: 50,
                whichOne: 1.2,
                accountImage: AssetImage("assets/images/scott_lang.jpg"),
                accountName: "scott_lang",
                isLikeOrComment: true,
                sideImage: AssetImage("assets/images/steve_rogers.jpg"),
                time: "5d",
              ),
              MySpaces.vGapInBetween,
              ActivityTileWidget(
                widgetHeight: 50,
                whichOne: 0,
                accountImage: AssetImage("assets/images/steph_strange.jpg"),
                accountName: "steph_strange",
                isLikeOrComment: true,
                sideImage: AssetImage("assets/images/thor.jpg"),
                time: "5d",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
