import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class UserProfile extends Equatable {
  const UserProfile({
    required this.uid,
    required this.username,
    required this.email,
    required this.avatarUri,
  });

  const UserProfile.empty()
      : uid = null,
        username = null,
        email = null,
        avatarUri = null;

  @HiveField(0)
  final String? uid;

  @HiveField(1)
  final String? username;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? avatarUri;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  UserProfile copyWith({
    String? uid,
    String? username,
    String? email,
    String? avatarUri,
  }) {
    return UserProfile(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      email: email ?? this.email,
      avatarUri: avatarUri ?? this.avatarUri,
    );
  }

  @override
  List<Object?> get props => [
        uid,
        username,
        email,
        avatarUri,
      ];
}
