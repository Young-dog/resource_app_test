// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:resourse_app/repositories/models/users/user.dart';
import 'package:resourse_app/repositories/models/users/user_update.dart';

import '../../../repositories/user/user_repositories.dart';
import '../../auth/widgets/button_for_auth_screen.dart';
import '../widget/field_data_for_user.dart';
import '../widget/user_avatar.dart';

class EditProfileScreen extends StatefulWidget {
  static const String id = 'edit_profile_screen';

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey _key = GlobalKey<FormState>();

  UserAccount? _user;

  late final _editProfileBloc;

  late final _nameController;

  late final _descriptionController;

  late final _phoneController;

  late final _mailController;
  late final _uidController;
  late final _imageUlrController;

  Future<void> _loadUser() async {
    _user = await UserRepositories().getUserData();
    _nameController.text = _user!.name;
    _descriptionController.text = _user!.description;
    _phoneController.text = _user!.phone;
    _mailController.text = _user!.mail;
    _uidController.text = _user!.uniqueId;
    setState(() {});
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    final user = UserUpdate(
      imageFile: _imageUlrController.text,
      phone: _phoneController.text,
      mail: _mailController.text,
      name: _nameController.text,
      description: _descriptionController.text,
    );

    _editProfileBloc.add(UploadDataProfileEvent(
      userUpdate: user,
    ));
  }

  @override
  void initState() {
    _loadUser();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _phoneController = TextEditingController();
    _mailController = TextEditingController();
    _uidController = TextEditingController();
    _imageUlrController = TextEditingController();
    _editProfileBloc = context.read<EditProfileBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _mailController.dispose();
    _uidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: _user == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(35),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: <Widget>[
                      UserAvatar(
                        imageUrl: _user!.avatarUrl,
                        controller: _imageUlrController,
                      ),
                      const SizedBox(height: 35),
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
                      const SizedBox(height: 5),
                      //uid
                      FieldDataForUser(
                        height: 40,
                        theme: theme,
                        name: 'Уникальный идентификатор',
                        controller: _uidController,
                        callback: (value) {
                          if (value!.isEmpty) {
                            return 'Уникальный идентификатор не может быть пустым!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 65),
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
                      const SizedBox(height: 35),
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
                      const SizedBox(height: 5),
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
                      const SizedBox(
                        height: 90,
                      ),
                      ButtonForAuthScreen(
                        name: 'Изменить',
                        theme: theme.labelMedium!,
                        type: false,
                        color: Colors.white,
                        voidCallback: () {
                          _submit(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
