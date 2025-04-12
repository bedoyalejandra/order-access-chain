class User {
  String username;
  String password;
  bool isAdmin;

  User({
    required this.username,
    required this.password,
    this.isAdmin = false,
  });
}
