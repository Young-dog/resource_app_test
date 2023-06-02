part of 'user.dart';

class UserSignUp extends User {
  final String mail;
  final String password;
  final String username;
  final String description;
  final String phone;
  final String uniqueId;

  UserSignUp({
    required this.mail,
    required this.password,
    required this.username,
    required this.uniqueId,
    this.description = '',
    this.phone = '',
  });

  Future<void> signUp() async {}
}
