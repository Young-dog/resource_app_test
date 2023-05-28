part of 'user.dart';

class UserAccount extends User {
  // final String mail;
  // String? number;
  final String name;
  // String? birthdate;
  String? avatar;
  String? description;

  UserAccount({
    // required this.mail,
    required this.name,
    // this.number = '',
    // this.birthdate = '',
    this.avatar = '',
    this.description = '',
  });
}
