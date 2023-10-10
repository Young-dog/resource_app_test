import 'package:firebase_auth/firebase_auth.dart';
import '../../data/data.dart';
import '../domain.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<UserCredential> logIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  });

  Future<void> logInWithGoogle();

  Future<void> logOut();

  Future<void> reSubmitVerification({
    required UserCredential user,
  });

  Future<void> deleteAccount({required String uid});
}

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required RemoteAuthDataSource remoteAuthDataSource,
    required UserProfileRepositories userProfileRepositories,
  })  : _remoteAuthDataSource = remoteAuthDataSource,
        _userProfileRepositories = userProfileRepositories;

  final RemoteAuthDataSource _remoteAuthDataSource;
  final UserProfileRepositories _userProfileRepositories;

  @override
  Future<UserCredential> logIn({
    required String email,
    required String password,
  }) async {
    final user = await _remoteAuthDataSource.logIn(
      request: SignInRequestDto(
        email: email,
        password: password,
      ),
    );

    await _userProfileRepositories.setUserSessionLocal(
      userProfile: const UserProfile(uid: '', username: '', email: '', avatarUri: ''),
    );

    final userProfile = await _remoteAuthDataSource.getUserProfile(user: user);

    await _userProfileRepositories.setUserSessionLocal(userProfile: userProfile);

    return user;
  }

  @override
  Future<void> logInWithGoogle() async {
    final userProfile = await _remoteAuthDataSource.logInWithGoogle();

    if (userProfile != null) {
      await _userProfileRepositories.setUserSessionLocal(userProfile: userProfile);
    }
  }

  @override
  Future<void> logOut() async {
    await _remoteAuthDataSource.logOut();

    await _userProfileRepositories.setUserSessionLocal(
      userProfile: const UserProfile.empty(),
    );
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    await _remoteAuthDataSource.signUp(
      request: SignUpRequestDto(
        email: email,
        password: password,
        username: username,
      ),
    );


  }

  @override
  Future<void> reSubmitVerification({
    required UserCredential user,
  }) async {
    await _remoteAuthDataSource.reSubmitVerification(request: user);
  }

  @override
  Future<void> deleteAccount({required String uid}) async {
    await _remoteAuthDataSource.deleteAccount(uid: uid);
    await _remoteAuthDataSource.logOut();
  }
}
