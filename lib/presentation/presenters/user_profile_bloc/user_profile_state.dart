part of 'user_profile_bloc.dart';

class UserProfileState extends Equatable {
  const UserProfileState({
    required this.userProfile,
  });

  final UserProfile userProfile;

  @override
  List<Object?> get props => [
    userProfile,
  ];
}
