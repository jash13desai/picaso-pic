class User {
  final String userName;
  final String imageUrl;
  final String displayname;
  final int postNum;
  final int followers;
  final int following;
  final String bio;
  final List userPosts;

  User({
    required this.userName,
    required this.imageUrl,
    required this.displayname,
    required this.followers,
    required this.following,
    required this.postNum,
    required this.bio,
    required this.userPosts,
  });
}

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
      displayname: "Jash Desai",
      imageUrl: "assets/images/labyrinth.jpg",
      userName: "_jade13._",
      postNum: 40,
      followers: 369,
      following: 410,
      bio: "Sentiment is a chemical defect found the losing side..!!",
      userPosts: List.generate(40, (index) => "${photos[index]}"),
    );
  }
}
