// import 'package:firebase_auth/firebase_auth.dart';
import 'package:insta_ui_only/models/user.dart';

// manually made up dummy data to use at various place
// class User {
//   final String userName;
//   final String imageUrl;
//   final String displayname;
//   final int postNum;
//   final int followers;
//   final int following;
//   final String bio;
//   final List userPosts;

//   User({
//     this.userName,
//     this.imageUrl,
//     this.displayname,
//     this.followers,
//     this.following,
//     this.postNum,
//     this.bio,
//     this.userPosts,
//   });
// }

class MyUserData {
  final List photos = [
    ('assets/images/tony_stark.jpg'),
    ('assets/images/pet_par.jpg'),
    ('assets/images/steve_rogers.jpg'),
    ('assets/images/steph_strange.jpg'),
    ('assets/images/black_panther.jpg'),
    ('assets/images/loki_post.jpg'),
    ('assets/images/mich_jon.jpg'),
    ('assets/images/nat_rom.jpg'),
    ('assets/images/nat_rom_post.jpg'),
    ('assets/images/nat_rom_post1.jpg'),
    ('assets/images/miles_morales.jpg'),
    ('assets/images/ned_leeds.jpg'),
    ('assets/images/spidy.jpg'),
    ('assets/images/scott_lang.jpg'),
    ('assets/images/thor.jpg'),
    ('assets/images/pet_par1.jpg'),
    ('assets/images/steve_rogers.jpg'),
    ('assets/images/wade_wilson.jpg'),
    ('assets/images/ned_post.jpg'),
    ('assets/images/flerken.jpg'),
    ('assets/images/tony_stark_post1.jpg'),
    ('assets/images/pet_par_post.jpg'),
    ('assets/images/tony_stark.jpg'),
    ('assets/images/pet_par.jpg'),
    ('assets/images/steve_rogers.jpg'),
    ('assets/images/steph_strange.jpg'),
    ('assets/images/black_panther.jpg'),
    ('assets/images/loki_post.jpg'),
    ('assets/images/mich_jon.jpg'),
    ('assets/images/nat_rom.jpg'),
    ('assets/images/nat_rom_post.jpg'),
    ('assets/images/nat_rom_post1.jpg'),
    ('assets/images/miles_morales.jpg'),
    ('assets/images/ned_leeds.jpg'),
    ('assets/images/spidy.jpg'),
    ('assets/images/scott_lang.jpg'),
    ('assets/images/thor.jpg'),
    ('assets/images/pet_par1.jpg'),
    ('assets/images/steve_rogers.jpg'),
    ('assets/images/wade_wilson.jpg'),
    ('assets/images/ned_post.jpg'),
    ('assets/images/flerken.jpg'),
    ('assets/images/tony_stark_post1.jpg'),
    ('assets/images/pet_par_post.jpg'),
  ];

  User get currentUser {
    return User(
      // displayname: FirebaseAuth.instance.currentUser.displayName,
      displayname: "hehe",
      // imageUrl: "assets/images/user-default-grey.png",
      // imageUrl: FirebaseAuth.instance.currentUser.photoURL,
      imageUrl: "assets/images/labyrinth.jpg",
      // userName: FirebaseAuth.instance.currentUser.displayName,
      userName: "hehe",
      postNum: 40,
      followers: 369,
      following: 410,
      bio: "Sentiment is a chemical defect found the losing side..!!",
      userPosts: List.generate(40, (index) => "${photos[index]}"),
    );
  }
}
