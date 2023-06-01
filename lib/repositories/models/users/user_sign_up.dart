part of 'user.dart';

class UserSignUp extends User {
  final String login;
  final String password;
  final String username;

  UserSignUp({
    required this.login,
    required this.password,
    required this.username,
  });

  Future<void> signUp() async {}
}
