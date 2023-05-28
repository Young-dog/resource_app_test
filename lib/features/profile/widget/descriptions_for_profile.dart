import 'package:flutter/material.dart';

class DescriptionsForProfile extends StatelessWidget {
  const DescriptionsForProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text("username", style: theme.bodySmall );
  }
}
