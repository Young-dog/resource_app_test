import 'package:flutter/material.dart';

class DescriptionsForProfile extends StatelessWidget {
  final String name;
  final String description;
  final String phone;
  final String mail;

  const DescriptionsForProfile({
    Key? key,
    required this.name,
    required this.phone,
    required this.description,
    required this.mail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: <Widget>[
          ListTile(
            horizontalTitleGap: 4,
            dense: true,
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            titleAlignment: ListTileTitleAlignment.center,
            leading: Text('Имя:', style: theme.bodySmall,),
            title: Text(name, style: theme.bodySmall,),
          ),
          ListTile(
            horizontalTitleGap: 4,
            dense: true,
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            minVerticalPadding: 0.1,
            titleAlignment: ListTileTitleAlignment.center,
            leading: Text('О себе:', style: theme.bodySmall,),
            title: Text(description,
              style: theme.bodySmall,),
          ),
          ListTile(
            horizontalTitleGap: 4,
            dense: true,
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            minVerticalPadding: 0.1,
            titleAlignment: ListTileTitleAlignment.center,
            leading: Text('Телефон:', style: theme.bodySmall,),
            title: Text(phone,
              style: theme.bodySmall,),
          ),
          ListTile(
            horizontalTitleGap: 4,
            dense: true,
            visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            minVerticalPadding: 0.1,
            titleAlignment: ListTileTitleAlignment.center,
            leading: Text('E-mail:', style: theme.bodySmall,),
            title: Text(mail,
              style: theme.bodySmall,),
          ),
        ],
      ),
    );
  }
}
