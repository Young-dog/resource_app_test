import 'dart:async';
import 'dart:io';
import 'package:get_it/get_it.dart';
import '../../data/data.dart';
import '../domain.dart';

abstract class UserProfileRepositories {
  const UserProfileRepositories();

  Stream<UserProfile> get userProfileChanges;

  UserProfile get userProfile;

  Future<void> setUserSessionLocal({required UserProfile userProfile});

  Future<void> setUserSessionRemote({required UserProfile userProfile});

  Future<String> changeImageAvatar({
    required File file,
    required String uid,
  });
}

class UserProfileRepositoriesImpl
    implements UserProfileRepositories, Disposable {
  UserProfileRepositoriesImpl._internal({
    required UserProfile userProfile,
    required LocaleUserProfileDataSource localeUserProfileDataSource,
    required RemoteUserProfileDataSource remoteUserProfileDataSource,
  })  : _userProfile = userProfile,
        _remoteUserProfileDataSource = remoteUserProfileDataSource,
        _localeUserProfileDataSource = localeUserProfileDataSource {
    _userProfileController = StreamController<UserProfile>.broadcast();
  }

  static Future<UserProfileRepositoriesImpl> create({
    required LocaleUserProfileDataSource localeUserProfileDataSource,
    required RemoteUserProfileDataSource remoteUserProfileDataSource,
  }) async {
    final userProfile = await localeUserProfileDataSource.getUserProfile();

    final userProfileRepository = UserProfileRepositoriesImpl._internal(
      userProfile: userProfile,
      localeUserProfileDataSource: localeUserProfileDataSource,
      remoteUserProfileDataSource: remoteUserProfileDataSource,
    );

    return userProfileRepository;
  }

  late final StreamController<UserProfile> _userProfileController;

  final LocaleUserProfileDataSource _localeUserProfileDataSource;

  final RemoteUserProfileDataSource _remoteUserProfileDataSource;

  UserProfile _userProfile;

  @override
  Future<void> setUserSessionLocal({required UserProfile userProfile}) async {
    await _localeUserProfileDataSource.putUserProfile(userProfile: userProfile);

    _userProfileController.add(userProfile);
    _userProfile = userProfile;
  }

  @override
  UserProfile get userProfile => _userProfile;

  @override
  Stream<UserProfile> get userProfileChanges => _userProfileController.stream;

  @override
  FutureOr<void> onDispose() {
    _userProfileController.close();
  }

  @override
  Future<void> setUserSessionRemote({required UserProfile userProfile}) async {
    await _remoteUserProfileDataSource.changeUserProfile(
      userProfile: userProfile,
    );

    await _localeUserProfileDataSource.putUserProfile(userProfile: userProfile);

    _userProfileController.add(userProfile);
    _userProfile = userProfile;
  }

  @override
  Future<String> changeImageAvatar({
    required File file,
    required String uid,
  }) async {
    final uri = await _remoteUserProfileDataSource.changeUserAvatar(
      file: file,
      uid: uid,
    );

    final userProfile = _userProfile.copyWith(avatarUri: uri);

    await _localeUserProfileDataSource.putUserProfile(userProfile: userProfile);

    _userProfileController.add(userProfile);
    _userProfile = userProfile;

    return uri;
  }
}
