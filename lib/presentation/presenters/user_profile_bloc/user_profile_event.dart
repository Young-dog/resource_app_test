part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object?> get props => [];
}

class ChangeUserProfileEvent extends UserProfileEvent {
  const ChangeUserProfileEvent({
    required this.userProfile,
  });

  final UserProfile userProfile;

  @override
  List<Object?> get props => [
        userProfile,
      ];
}
