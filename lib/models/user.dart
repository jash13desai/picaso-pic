class User {
  final String userName;
  final String imageUrl;
  final String displayname;
  final int postNum;
  final int followers;
  final int following;
  final String bio;
  final List<String> userPosts;

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
