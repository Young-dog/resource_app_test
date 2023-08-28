import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<UserCredential> logIn({
    required String email,
    required String password,
  });

  Future<void> signUp({
    required String email,
    required String password,
  });

  Future<void> logInWithGoogle();

  Future<void> logOut();

  Future<void> reSubmitVerification({
    required UserCredential user,
  });
}

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<UserCredential> logIn({
    required String email,
    required String password,
  }) async {
    final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return user;
  }

  @override
  Future<void> logInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> logOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await user.user?.sendEmailVerification();
  }

  @override
  Future<void> reSubmitVerification({
    required UserCredential user,
  }) async {
    await user.user!.sendEmailVerification();
  }
}
