import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/features/auth/auth_screen.dart';
import 'package:resourse_app/theme/theme.dart';
import 'package:resourse_app/utils/router/router.dart';

import 'features/auth/bloc/auth_bloc.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider (
          create: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        theme: darkTheme,
        home: const AuthScreen(),
        routes: router,
      ),
    );
  }
}