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
      description: userdata['description'],
      avatarUrl: userdata['imageAvatar'],
      mail: userdata['mail'],
      uniqueId: userdata['userId'],
      phone: userdata['phone'],
    );
    return user;
  }
}
