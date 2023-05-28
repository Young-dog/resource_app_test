import 'package:flutter/material.dart';

import '../../../repositories/user/user_repositories.dart';

class EditProfileScreen extends StatelessWidget {
  static const String id = 'edit_profile_screen';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            ElevatedButton(onPressed:() {
              UserRepositories().getUserData();
            }, child: Icon(Icons.download))
          ],
        ),
      ),
    );
  }
}
