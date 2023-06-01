import 'package:firebase_auth/firebase_auth.dart';

import '../models/users/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositories {
  Future<UserAccount> getUserData() async {
    Map<String, dynamic>? userdata;
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser)
        .get();
    userdata = data.data()!;
    UserAccount user = UserAccount(
      name: userdata['username'],
      description: userdata['mail'],
      avatar: userdata['imageAvatar'],
    );
    return user;
  }
}
