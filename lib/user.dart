class User{
  String username;
  String imageUrl;
  int followers;
  int followings;
  int public_repo;
  String joined_date;

  User({
    required this.username,
    required this.imageUrl,
    required this.followers,
    required this.followings,
    required this.public_repo,
    required this.joined_date,
    });
}