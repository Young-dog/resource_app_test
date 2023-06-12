part of 'user.dart';

class UserAccount extends User {
  final String name;
  final String avatarUrl;
  final Map<String, dynamic> description;
  final Map<String, dynamic> phone;
  final Map<String, dynamic> mail;
  final String uniqueId;

  UserAccount({
    required this.name,
    required this.mail,
    required this.uniqueId,
    required this.avatarUrl,
    required this.description,
    required this.phone,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        avatarUrl,
        description,
        phone,
        mail,
        uniqueId,
      ];
}
