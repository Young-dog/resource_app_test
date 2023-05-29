part of 'user.dart';

class UserAccount extends User {
  final String name;
  String? avatar;
  String? description;

  UserAccount({
    required this.name,
    this.avatar = 'assets/icons/profile.svg',
    this.description = '',
  });
}
