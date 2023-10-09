part of 'profile_bloc.dart';

enum ProfileStatus {
  initial,
  loading,
  failure,
  changed,
  loadingImg,
  changedImg,
  success;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;

  bool get isFailure => this == failure;

  bool get isChanged => this == changed;

  bool get isLoadingImg => this == loadingImg;

  bool get isChangedImg => this == changedImg;

  bool get isSuccess => this == success;
}

class ProfileState extends Equatable {
  const ProfileState({
    required this.status,
    required this.username,
    required this.email,
    required this.uid,
    required this.avatarUri,
  });

  final ProfileStatus status;
  final String username;
  final String email;
  final String uid;
  final String avatarUri;

  const ProfileState.initial({
    String? username,
    String? email,
    String? uid,
    String? avatarUri,
  })  : status = ProfileStatus.initial,
        username = username ?? '',
        email = email ?? '',
        uid = uid ?? '',
        avatarUri = avatarUri ?? '';

  ProfileState copyWith({
    ProfileStatus? status,
    String? username,
    String? email,
    String? uid,
    String? avatarUri,
  }) {
    return ProfileState(
      status: status ?? this.status,
      username: username ?? this.username,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      avatarUri: avatarUri ?? this.avatarUri,
    );
  }

  @override
  List<Object?> get props => [
        status,
        username,
        email,
        uid,
        avatarUri,
      ];
}
