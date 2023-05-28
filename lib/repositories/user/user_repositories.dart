import 'package:firebase_auth/firebase_auth.dart';

import '../models/users/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositories {
  Future<void> getUserData() async {
    Map<String, dynamic>? userdata;
    UserAccount? user;
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    final data = await FirebaseFirestore.instance.collection('users').doc(currentUser).get();
    if(data.exists) {
      userdata = data.data()!;
      user = UserAccount(name: userdata['username'], description: userdata['mail']);
      print(userdata['username']);
    }
  }
}
