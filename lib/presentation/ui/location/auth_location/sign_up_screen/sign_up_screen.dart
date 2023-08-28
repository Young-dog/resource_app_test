import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/app.dart';
import '../../../../../domain/domain.dart';
import '../../../../presentation.dart';
import 'view/view.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => SignUpBloc(authRepository: AuthRepositoryImpl()),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: const AuthAppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spacings.x4),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state.status.isLoading) {
                  return const Center(child: CircularProgressIndicator(),);
                }

                if (state.status.isInputPass) {
                  return const FillingPasswordView();
                }

                if (state.status.isSuccess) {
                  return const VerifyEmailView();
                }

                return const SignUpView();
              },
            ),
          ),
        ),
      ),
    );
  }
}
