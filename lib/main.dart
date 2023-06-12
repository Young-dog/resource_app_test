import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:resourse_app/resorse_app.dart';
import 'package:resourse_app/utils/firebase_options.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runTalkerZonedGuarded(talker, () => runApp(const MyApp()),
      (error, stack) => GetIt.I<Talker>().handle(error, stack));
}
