import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/features/auth/auth_screen.dart';
import 'package:resourse_app/features/home_page/view/home_page.dart';
import 'package:resourse_app/theme/theme.dart';
import 'package:resourse_app/utils/router/router.dart';

import 'features/auth/bloc/auth_bloc.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _buildHomeScreen() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return AuthScreen();
        }
      },
    );
  }

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
        home: _buildHomeScreen(),
        routes: router,
      ),
    );
  }
}