import 'package:firebase_auth/firebase_auth.dart';
import '../../data/data.dart';

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
}

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required RemoteAuthDataSource remoteAuthDataSource,
  }) : _remoteAuthDataSource = remoteAuthDataSource;

  final RemoteAuthDataSource _remoteAuthDataSource;

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

    return user;
  }

  @override
  Future<void> logInWithGoogle() async {
    await _remoteAuthDataSource.logInWithGoogle();
  }

  @override
  Future<void> logOut() async {
    await _remoteAuthDataSource.logOut();
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
}
