import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/sign_in_screen/sign_in.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: AuthBloc(),
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        if (state is AuthSignInState || state is AuthSignUpEvent) {
          return Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.gpp_good),
            ),
          );
        }
        if (state is AuthFailureState) {
          return AlertDialog(
            title: Text(state.failureException.toString()),
          );
        }
        return const SignInScreen();
      },
    );
  }
}
