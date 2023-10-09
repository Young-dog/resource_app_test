import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import '../../app/app.dart';
import '../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

abstract class RemoteUserProfileDataSource {
  Future<void> changeUserProfile({required UserProfile userProfile});

  Future<String> changeUserAvatar({
    required File file,
    required String uid,
  });
}

class RemoteUserProfileDataSourceImpl implements RemoteUserProfileDataSource {
  const RemoteUserProfileDataSourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseStorage fireStorage,
    required FileManager fileManager,
  })  : _fireStore = firestore,
        _fireStorage = fireStorage,
        _fileManager = fileManager;

  final FirebaseFirestore _fireStore;

  final FirebaseStorage _fireStorage;

  final FileManager _fileManager;

  @override
  Future<void> changeUserProfile({required UserProfile userProfile}) async {
    await _fireStore
        .collection(FirebaseNames.users)
        .doc(userProfile.uid)
        .set(userProfile.toJson());
  }

  @override
  Future<String> changeUserAvatar({
    required File file,
    required String uid,
  }) async {
    String? url;

    String? newPath;

    final extension = path.extension(file.path);

    await _fireStorage
        .ref('${FirebaseNames.userAvatars}$uid.$extension')
        .putFile(file)
        .then((snapshot) async {
      url = await snapshot.ref.getDownloadURL();
    });

    if (url != null) {
      newPath = await _fileManager.saveLocal(
        file: file,
        name: uid,
      );
    }

    await _fireStore
        .collection('users')
        .doc(uid)
        .update(AvatarUriRequestDto(avatarUri: url ?? '').toJson());

    return newPath ?? '';
  }
}
