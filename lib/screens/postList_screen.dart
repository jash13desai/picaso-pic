import 'package:flutter/material.dart';
import 'package:insta_ui_only/providers/posts.dart';
import 'package:insta_ui_only/widgets/post_widget.dart';
import 'package:provider/provider.dart';
import 'stories_screen.dart';

class InstaList extends StatelessWidget {
  static const route = '/postList_screen';
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return RefreshIndicator(
      color: Colors.pink,
      onRefresh: () async {
        await Provider.of<Posts>(context, listen: false).fetchAndSetPosts();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: InstaStories(),
              height: deviceSize.height * 0.15,
            ),
            Consumer<Posts>(
              builder: (ctx, posts, _) {
                return Column(
                  children: [
                    if (posts.posts.isEmpty)
                      Column(
                        children: [
                          SizedBox(height: 40),
                          CircularProgressIndicator(
                            color: Colors.pink,
                          ),
                        ],
                      ),
                    ...posts.posts.map((post) => PostWidget(post)).toList(),
                  ],
                );
              },
            ),
          ],

          // return ListView.builder(
          //   itemCount: 2,
          //   itemBuilder: (context, index) => index == 0
          //       ? new SizedBox(
          //           child: InstaStories(),
          //           height: deviceSize.height * 0.15,
          //         )
          //       : Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/tony_stark.jpg"),
          //         accountName: 'tony_stark',
          //         mainPostImage: Image.asset(
          //           "assets/images/tony_stark_post1.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/pet_par.jpg"),
          //         twoNames: 'pet_par, steph_strange',
          //         likes: '999',
          //         caption: "tony_stark Like Father like Son! ",
          //         time: "13 Mins Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/pet_par.jpg"),
          //         accountName: 'pet_par',
          //         mainPostImage: Image.asset(
          //           "assets/images/pet_par_post.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/tony_stark.jpg"),
          //         twoNames: 'tony_stark, ned_leeds',
          //         likes: '357',
          //         caption: "pet_par  It was just an 'Internship' , I swear!",
          //         time: "27 Mins Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/wade_wilson.jpg"),
          //         accountName: 'wade_wilson',
          //         mainPostImage: Image.asset(
          //           "assets/images/wade_wilson_post.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/steve_rogers.jpg"),
          //         twoNames: 'steve_rogers, ned_leeds',
          //         likes: '991',
          //         caption: "wade_wilson  Don't I look like a hero!?",
          //         time: "31 Mins Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/nat_rom.jpg"),
          //         accountName: 'nat_rom',
          //         mainPostImage: Image.asset(
          //           "assets/images/nat_rom_post.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/scott_lang.jpg"),
          //         twoNames: 'scott_lang, steve_rogers',
          //         likes: '791',
          //         caption: "nat_rom  I have the action figure!",
          //         time: "46 Mins Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/ned_leeds.jpg"),
          //         accountName: 'ned_leeds',
          //         mainPostImage: Image.asset(
          //           "assets/images/ned_post.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/mich_jon.jpg"),
          //         twoNames: 'mich_jon, pet_par',
          //         likes: '866',
          //         caption: "ned_leeds  Hey there, New friend!",
          //         time: "53 Mins Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/miles_morales.jpg"),
          //         accountName: 'miles_morales',
          //         mainPostImage: Image.asset(
          //           "assets/images/miles_morales_post.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/pet_par.jpg"),
          //         twoNames: 'pet_par, mich_jon',
          //         likes: '517',
          //         caption: "miles_morales  It's just a leap of faith!",
          //         time: "1 Hour Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/thor.jpg"),
          //         accountName: 'thor_odin',
          //         mainPostImage: Image.asset(
          //           "assets/images/thor_post.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/loki.jpg"),
          //         twoNames: 'just_loki, steph_strange',
          //         likes: '841',
          //         caption: "thor_odin I knew it! ",
          //         time: "1 Hour Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/mich_jon.jpg"),
          //         accountName: 'mich_jon',
          //         mainPostImage: Image.asset(
          //           "assets/images/pet_par_post1.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/ned_leeds.jpg"),
          //         twoNames: 'ned_leeds, pet_par',
          //         likes: '213',
          //         caption: "mich_jon Weird friends!",
          //         time: "2 Hours Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/nat_rom.jpg"),
          //         accountName: 'nat_rom',
          //         mainPostImage: Image.asset(
          //           "assets/images/nat_rom_post1.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/tony_stark.jpg"),
          //         twoNames: 'tony_stark, thor_odin',
          //         likes: '991',
          //         caption: "nat_rom  Meet my much-awaited Sister",
          //         time: "2 Hours Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/scott_lang.jpg"),
          //         accountName: 'scott_lang',
          //         mainPostImage: Image.asset(
          //           "assets/images/scott_lang_post.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/ned_leeds.jpg"),
          //         twoNames: 'ned_leeds, thor_odin',
          //         likes: '342',
          //         caption: "scott_lang  They have my figures too!",
          //         time: "2 Hours Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/mich_jon.jpg"),
          //         accountName: 'mich_jon',
          //         mainPostImage: Image.asset(
          //           "assets/images/mich_jon_post.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/pet_par.jpg"),
          //         twoNames: 'pet_par, ned_leeds',
          //         likes: '866',
          //         caption: "mich_jon Companions? Maybe",
          //         time: "3 Hours Ago",
          //       ),
          //       PostWidget(
          //         accountImage: AssetImage("assets/images/tony_stark.jpg"),
          //         accountName: 'tony_stark',
          //         mainPostImage: Image.asset(
          //           "assets/images/tony_stark_post.jpg",
          //           fit: BoxFit.cover,
          //         ),
          //         likedImage: AssetImage("assets/images/pet_par.jpg"),
          //         twoNames: 'pet_par, steve_rogers',
          //         likes: '517',
          //         caption: "tony_stark The real heros!",
          //         time: "3 Hours Ago",
          //       ),
          // ],
          // ),
          // );
          // return RefreshIndicator(
          //   onRefresh: () async {
          //     await Provider.of<Posts>(context, listen: false).fetchAndSetPosts();
          //   },
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           child: InstaStories(),
          //           height: deviceSize.height * 0.15,
          //         ),
          //         Consumer<Posts>(
          //           builder: (ctx, posts, _) {
          //             return Column(
          //               children: [
          //                 ...posts.posts.map((post) => PostWidget(post)).toList(),
          //               ],
          //             );
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
        ),
      ),
    );
  }
}
