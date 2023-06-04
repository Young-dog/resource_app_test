import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/features/auth/auth_screen.dart';
import 'package:resourse_app/features/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:resourse_app/theme/theme.dart';
import 'package:resourse_app/utils/router/router.dart';

import 'features/auth/bloc/auth_bloc.dart';
import 'features/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _buildHomeScreen() {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const AuthScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => EditProfileBloc(),
        )
      ],
      child: MaterialApp(
        theme: darkTheme,
        home: _buildHomeScreen(),
        routes: router,
      ),
    );
  }
}
