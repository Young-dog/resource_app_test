// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:resourse_app/features/confidentiality/confidentiality.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../edit_profile/edit_profile.dart';

class SideBar extends StatefulWidget {
  final TextTheme theme;
  final authBloc;
  const SideBar({Key? key, required this.theme, required this.authBloc}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Редактировать профиль',
              style: widget.theme.bodySmall,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfileScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Конфеденциальность',
              style: widget.theme.bodySmall,
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConfidentialityScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Уведомления',
              style: widget.theme.bodySmall,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Выход',
              style: widget.theme.bodySmall,
            ),
            onTap: () {
              widget.authBloc.add(AuthLogOutEvent());
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
