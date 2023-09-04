import 'package:flutter/material.dart';

import '../../../../app/app.dart';

class SideHomeMenu extends StatelessWidget {
  const SideHomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: theme.palette.bgPrimary,
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text('Header'),
          ),
          ListTile(
            title: const Text('First Menu Item'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Second Menu Item'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('About'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
