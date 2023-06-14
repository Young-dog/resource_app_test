import 'package:flutter/material.dart';

class DescriptionsForProfile extends StatefulWidget {
  final String name;
  final Map<String, dynamic> description;
  final Map<String, dynamic> phone;
  final Map<String, dynamic> mail;

  const DescriptionsForProfile({
    Key? key,
    required this.name,
    required this.phone,
    required this.description,
    required this.mail,
  }) : super(key: key);

  @override
  State<DescriptionsForProfile> createState() => _DescriptionsForProfileState();
}

class _DescriptionsForProfileState extends State<DescriptionsForProfile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: <Widget>[
          ListTile(
            horizontalTitleGap: 4,
            dense: true,
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            // titleAlignment: ListTileTitleAlignment.center,
            leading: Text('Имя:', style: theme.bodySmall,),
            title: Text(widget.name, style: theme.bodySmall,),
          ),
          widget.description['conf'] ? ListTile(
            horizontalTitleGap: 4,
            dense: true,
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            minVerticalPadding: 0.1,
            // titleAlignment: ListTileTitleAlignment.center,
            leading: Text('О себе:', style: theme.bodySmall,),
            title: Text(widget.description['data'],
              style: theme.bodySmall,),
          ) : Container(),
          widget.phone['conf'] ? ListTile(
            horizontalTitleGap: 4,
            dense: true,
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            minVerticalPadding: 0.1,
            // titleAlignment: ListTileTitleAlignment.center,
            leading: Text('Телефон:', style: theme.bodySmall,),
            title: Text(widget.phone['number'],
              style: theme.bodySmall,),
          ) :  Container(),
          widget.mail['conf'] ?ListTile(
            horizontalTitleGap: 4,
            dense: true,
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            minVerticalPadding: 0.1,
            // titleAlignment: ListTileTitleAlignment.center,
            leading: Text('E-mail:', style: theme.bodySmall,),
            title: Text(widget.mail['e-mail'],
              style: theme.bodySmall,),
          ) : Container(),
        ],
      ),
    );
  }
}
