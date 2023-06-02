import 'dart:io';

import 'package:resourse_app/repositories/models/users/user.dart';

class UserUpdate extends User {
  final String imageFile;
  final String phone;
  final String mail;
  final String name;
  final String description;

  UserUpdate({
    required this.imageFile,
    required this.phone,
    required this.mail,
    required this.name,
    required this.description,
  });
}
