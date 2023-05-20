import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/features/auth/widgets/sign_in_screen/sign_in.dart';

import '../bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if(state is AuthLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white,),
          );
        }
        if (state is AuthSignInState || state is AuthSignUpEvent) {

        }
      },
    );
  }
}
