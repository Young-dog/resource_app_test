import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<bool> get authStateChanges =>
      _auth.authStateChanges().map((User? user) => user != null);

}
