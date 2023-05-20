part of 'user.dart';

class UserSignIn extends User {
  final String login;
  final String password;

  UserSignIn({required this.login, required this.password});

  Future<void> signIn() async {}

}