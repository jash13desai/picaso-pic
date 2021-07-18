import 'package:flutter/material.dart';
import 'package:insta_ui_only/widgets/searchbar_widget.dart';
import 'package:insta_ui_only/widgets/dm_widget.dart';
import 'package:insta_ui_only/widgets/textfield_widget.dart';

class DMScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => index == 0
          ? SizedBox(
              child: SearchBar(),
              height: deviceSize.height * 0.08,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ChatBox(
                  chatImage: AssetImage('assets/images/pet_par.jpg'),
                  chatName: "pet_par",
                  chatDetail: "But I’m Nothing Without This Suit!",
                  time: "now",
                  ringEnabled: true,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/tony_stark.jpg'),
                  chatName: "tony_stark",
                  chatDetail: "Love you 3000!",
                  time: "1m",
                  ringEnabled: true,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/steve_rogers.jpg'),
                  chatName: "steve_rogers",
                  chatDetail: "Big man in a suit of armor. Take th...",
                  time: "3m",
                  ringEnabled: false,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/thor.jpg'),
                  chatName: "thor_odin",
                  chatDetail: "Noticed you've copied my beard.",
                  time: "3m",
                  ringEnabled: true,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/black_panther.jpg'),
                  chatName: "black_panther",
                  chatDetail: " And get this man a shield!",
                  time: "5m",
                  ringEnabled: false,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/nat_rom.jpg'),
                  chatName: "nat_rom",
                  chatDetail: "This Is Just Like Budapest All Over...",
                  time: "7m",
                  ringEnabled: true,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/ned_leeds.jpg'),
                  chatName: "ned_leeds",
                  chatDetail: "We're all gonna die!",
                  time: "19m",
                  ringEnabled: true,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/steph_strange.jpg'),
                  chatName: "steph_strange",
                  chatDetail: "Dormammu, I've come to bargain.",
                  time: "21m",
                  ringEnabled: false,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/miles_morales.jpg'),
                  chatName: "miles_morales",
                  chatDetail: "It's just a leap of faith!",
                  time: "23m",
                  ringEnabled: true,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/scott_lang.jpg'),
                  chatName: "scott_lang",
                  chatDetail: "Why don't you pick on someone...",
                  time: "23m",
                  ringEnabled: true,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/wade_wilson.jpg'),
                  chatName: "wade_wilson",
                  chatDetail: "Well, that’s just lazy writing.",
                  time: "25m",
                  ringEnabled: false,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/mich_jon.jpg'),
                  chatName: "mich_jon",
                  chatDetail: "Too late. You guys are losers.",
                  time: "27m",
                  ringEnabled: true,
                ),
                ChatBox(
                  chatImage: AssetImage('assets/images/loki.jpg'),
                  chatName: "just_loki",
                  chatDetail: "I am a god, you dull creature, an...",
                  time: "27m",
                  ringEnabled: true,
                ),
              ],
            ),
    );
  }
}
