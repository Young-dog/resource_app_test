import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/users/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepositories extends Equatable{
  UserAccount? user;
  Future<UserAccount> getUserData() async {
    Map<String, dynamic>? userdata;
    final currentUser = FirebaseAuth.instance.currentUser!.uid;
    final data = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser)
        .get();
    userdata = data.data()!;
    user = UserAccount(
      name: userdata['username'],
      description: userdata['description'],
      avatarUrl: userdata['imageAvatar'],
      mail: userdata['mail'],
      uniqueId: userdata['userId'],
      phone: userdata['phone'],
    );
    return user!;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}
