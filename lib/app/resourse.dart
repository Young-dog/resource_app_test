import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../domain/domain.dart';
import '../generated/l10n.dart';
import '../presentation/presentation.dart';
import 'router/router.dart';
import 'themes/dark_theme_builder.dart';

class Resourse extends StatelessWidget {
  Resourse({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LogInBloc(authRepository:  AuthRepositoryImpl()),),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: _appRouter.config(
          navigatorObservers: () =>
          [
            TalkerRouteObserver(GetIt.I<Talker>()),
          ],
        ),
        locale: const Locale('ru'),
        supportedLocales: S.delegate.supportedLocales,
        theme: const DarkThemeBuilder().build(),
      ),
    );
  }
}
