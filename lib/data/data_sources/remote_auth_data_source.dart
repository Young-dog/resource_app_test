import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../data.dart';

abstract class RemoteAuthDataSource {
  const RemoteAuthDataSource();

  Future<UserCredential> logIn({required SignInRequestDto request});

  Future<void> signUp({required SignUpRequestDto request});

  Future<void> logOut();

  Future<void> logInWithGoogle();

  Future<void> reSubmitVerification({required UserCredential request});
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  const RemoteAuthDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  })  : _auth = firebaseAuth,
        _fireStore = firebaseFirestore;

  final FirebaseAuth _auth;

  final FirebaseFirestore _fireStore;

  @override
  Future<UserCredential> logIn({required SignInRequestDto request}) async {
    final user = await _auth.signInWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    return user;
  }

  @override
  Future<void> signUp({required SignUpRequestDto request}) async {
    final user = await _auth.createUserWithEmailAndPassword(
      email: request.email,
      password: request.password,
    );

    await user.user?.sendEmailVerification();

    await _fireStore.collection('users').doc(user.user!.uid).set({
      'userId': user.user!.uid,
      'username': request.username,
      'e-mail': request.email,
    });
  }

  @override
  Future<void> logOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> logInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);

    await _fireStore.collection('users').doc(userCredential.user!.uid).set({
      'userId': userCredential.user!.uid,
      'username': userCredential.user!.displayName,
      'e-mail': userCredential.user!.email,
    });

  }

  @override
  Future<void> reSubmitVerification({required UserCredential request}) async {
    await request.user?.sendEmailVerification();
  }
}
