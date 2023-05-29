part of 'user.dart';

class UserSignUp extends User {
  final String login;
  final String password;
  final String username;
  final String avatar;

  UserSignUp({
    required this.login,
    required this.password,
    required this.username,
    required this.avatar,
  });

  Future<void> signUp() async {}
}
