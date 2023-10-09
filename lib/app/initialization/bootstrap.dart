import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/core.dart';
import '../app.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  await await runTalkerZonedGuarded(
    TalkerFlutter.init(),
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await initializeHive();

      await registerDependencies();

      await GetIt.instance.allReady();

      await GetIt.instance<NotificationService>().initialize();

      runApp(await builder());

    },
    (error, stack) => GetIt.I<Talker>().handle(error, stack),
  );
}
