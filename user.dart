class User {
  final String _username;
  final String _password;
  final bool _isAdmin;

  User({
    required String username,
    required String password,
    bool isAdmin = false,
  })  : _username = username,
        _password = password,
        _isAdmin = isAdmin;

  String get username => _username;
  bool get isAdmin => _isAdmin;

  bool isPasswordValid(String passwordToCheck) {
    return _password == passwordToCheck;
  }
}
