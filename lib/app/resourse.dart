import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../core/core.dart';
import '../generated/l10n.dart';
import 'app.dart';

class Resourse extends StatelessWidget {
  Resourse({super.key});

  final _appRouter = GetIt.instance<AppRouter>();

  @override
  Widget build(BuildContext context) {

    return GlobalBlocInjector(
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            TalkerRouteObserver(GetIt.I<Talker>()),
          ],
        ),
        locale: const Locale('ru'),
        supportedLocales: S.delegate.supportedLocales,
        theme: const DarkThemeBuilder().build(),
        scaffoldMessengerKey: GetIt.instance<SnackBarService>(),
      ),
    );
  }
}
