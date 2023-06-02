part of 'user.dart';

class UserAccount extends User {
  final String name;
  final String avatarUrl;
  final String description;
  final String phone;
  final String mail;
  final String uniqueId;


  UserAccount({
    required this.name,
    required this.mail,
    required this.uniqueId,
    required this.avatarUrl,
    required this.description,
    required this.phone,
  });
}
