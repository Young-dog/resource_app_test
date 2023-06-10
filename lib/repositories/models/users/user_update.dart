import 'package:resourse_app/repositories/models/users/user.dart';

class UserUpdate extends User {
  final String imageUrl;
  final String phone;
  final String mail;
  final String name;
  final String description;

  UserUpdate({
    required this.imageUrl,
    required this.phone,
    required this.mail,
    required this.name,
    required this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    imageUrl,
    description,
    phone,
    mail,
    name,
  ];
}
