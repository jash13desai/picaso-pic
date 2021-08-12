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
    this.userName,
    this.imageUrl,
    this.displayname,
    this.followers,
    this.following,
    this.postNum,
    this.bio,
    this.userPosts,
  });
}
