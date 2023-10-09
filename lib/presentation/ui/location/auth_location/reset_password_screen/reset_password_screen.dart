import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../app/app.dart';
import '../../../../presentation.dart';
import 'view/view.dart';

@RoutePage()
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => GetIt.instance<ResetPasswordBloc>(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: const AuthAppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spacings.x4),
            child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
              builder: (context, state) {
                if (state.status.isLoading) {
                  return const Center(child: CircularProgressIndicator(),);
                }

                if (state.status.isSuccess) {
                  return const SuccessSubmitResetView();
                }

                return const ResetPasswordView();
              },
            ),
          ),
        ),
      ),
    );
  }
}
