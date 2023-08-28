import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/app.dart';
import '../../../../presentation.dart';
import 'view/view.dart';

@RoutePage()
class ReVerificationScreen extends StatelessWidget {
  const ReVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const AuthAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
        ),
        child: BlocBuilder<LogInBloc, LogInState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator(),);
            }

            if (state.status.isReSubmit) {
              return const VerifyEmailView();
            }

            return const ReVerificationView();
          },
        ),
      ),
    );
  }
}
