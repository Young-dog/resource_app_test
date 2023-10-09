part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ChangeProfileUsernameEvent extends ProfileEvent {
  const ChangeProfileUsernameEvent({required this.username});

  final String username;

  @override
  List<Object?> get props => [
        username,
      ];
}

class ChangeProfileEmailEvent extends ProfileEvent {
  const ChangeProfileEmailEvent({required this.email});

  final String email;

  @override
  List<Object?> get props => [
        email,
      ];
}

class ChangeProfileAvatarEvent extends ProfileEvent {
  const ChangeProfileAvatarEvent();
}

class SubmitChangesEvent extends ProfileEvent {
  const SubmitChangesEvent();
}
