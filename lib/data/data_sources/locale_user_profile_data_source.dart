import 'package:hive_flutter/hive_flutter.dart';

import '../../app/app.dart';
import '../../domain/domain.dart';

abstract class LocaleUserProfileDataSource {
  Future<UserProfile> getUserProfile();

  Future<void> putUserProfile({required UserProfile userProfile});
}

class LocaleUserProfileDataSourceImpl implements LocaleUserProfileDataSource {
  LocaleUserProfileDataSourceImpl._internal({
    required Box<UserProfile> userProfileBox,
  }) : _userProfileBox = userProfileBox;

  static const String _userProfileKey = 'current';

  static Future<LocaleUserProfileDataSourceImpl> create({
    required HiveInterface hive,
  }) async {
    final userProfileBox =
        await hive.openBox<UserProfile>(HiveBoxes.userProfileBox);

    final localeUserProfile = LocaleUserProfileDataSourceImpl._internal(
      userProfileBox: userProfileBox,
    );

    return localeUserProfile;
  }

  final Box<UserProfile> _userProfileBox;

  @override
  Future<UserProfile> getUserProfile() async {
    final userProfile = _userProfileBox.get(
      _userProfileKey,
      defaultValue: const UserProfile.empty(),
    )!;

    return userProfile;
  }

  @override
  Future<void> putUserProfile({required UserProfile userProfile}) async {
    await _userProfileBox.put(_userProfileKey, userProfile);
  }
}
