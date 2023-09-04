import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presentation.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: IconButton(onPressed: () {
          context.read<LogInBloc>().add(LogOutEvent());
        }, icon: Icon(Icons.arrow_back_outlined),),
    ),);
  }
}
