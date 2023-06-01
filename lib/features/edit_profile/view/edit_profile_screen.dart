import 'package:flutter/material.dart';
import 'package:resourse_app/repositories/models/users/user.dart';

import '../../../repositories/user/user_repositories.dart';
import '../widget/field_data_for_user.dart';
import '../widget/user_avatar.dart';

class EditProfileScreen extends StatefulWidget {
  static const String id = 'edit_profile_screen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  UserAccount? _user;

  // ignore: prefer_typing_uninitialized_variables
  late final _nameController;

  // ignore: prefer_typing_uninitialized_variables
  late final _descriptionController;

  // ignore: prefer_typing_uninitialized_variables
  late final _phoneController;

  // ignore: prefer_typing_uninitialized_variables
  late final _mailController;

  Future<void> _loadUser() async {
    _user = await UserRepositories().getUserData();
    setState(() {});
  }

  @override
  void initState() {
    _loadUser();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _phoneController = TextEditingController();
    _mailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: _user == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(35),
                child: ListView(
                  children: <Widget>[
                    UserAvatar(imageUrl: _user!.avatar!),
                    const SizedBox(height: 25),
                    //name
                    FieldDataForUser(
                      height: 40,
                      theme: theme,
                      name: 'Имя',
                      controller: _nameController,
                      callback: (value) {
                        if (value!.isEmpty) {
                          return 'Имя не может быть пустым!';
                        }
                        if (value.length < 3) {
                          return 'Слишком короткое имя';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    //description
                    FieldDataForUser(
                      height: 90,
                      theme: theme,
                      name: 'О себе',
                      controller: _descriptionController,
                      callback: (value) {
                        return null;
                      },
                    ),
                    //phone
                    FieldDataForUser(
                      height: 40,
                      theme: theme,
                      name: 'Телефон',
                      controller: _phoneController,
                      callback: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    //mail
                    FieldDataForUser(
                      height: 40,
                      theme: theme,
                      name: 'e-mail',
                      controller: _mailController,
                      callback: (value) {
                        if (value!.isEmpty) {
                          return 'e-mail не может быть пустым!';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
