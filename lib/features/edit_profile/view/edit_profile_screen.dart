import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resourse_app/features/auth/bloc/auth_bloc.dart';
import 'package:resourse_app/repositories/models/users/user.dart';

import '../../../repositories/user/user_repositories.dart';
import '../widget/user_avatar.dart';

class EditProfileScreen extends StatefulWidget {
  static const String id = 'edit_profile_screen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  UserAccount? _user;


  Future<void> _loadUser() async {
    _user = await UserRepositories().getUserData();
    setState(() {});
  }

  @override
  void initState() {
    _loadUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _user == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: <Widget>[
                  _user!.avatar == ''
                      ? Container(
                          width: 75,
                          height: 75,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black54,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/profile.svg',
                                colorFilter: const ColorFilter.mode(
                                    Colors.black, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        )
                      : UserAvatar(imageUrl: _user!.avatar!)
                ],
              ),
      ),
    );
  }
}
