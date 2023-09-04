import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';
import '../../presentation/presentation.dart';
import '../app.dart';

final _getIt = GetIt.instance;

Future<void> registerDependencies() async {
  await _registerServices();
  await _registerDataSource();
  await _registerRepositories();
  await _registerBlocs();
}

Future<void> _registerServices() async {
  _getIt
    ..registerLazySingleton<SnackBarService>(SnackBarService.new)
    ..registerLazySingleton<Talker>(TalkerFlutter.init)
    ..registerLazySingleton<AppRouter>(AppRouter.new)
    ..registerSingleton<FirebaseAuth>(FirebaseAuth.instance)
    ..registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance)
    ..registerLazySingleton(AuthService.new);
}

Future<void> _registerDataSource() async {
  _getIt.registerLazySingleton<RemoteAuthDataSource>(
    () => RemoteAuthDataSourceImpl(
      firebaseAuth: _getIt<FirebaseAuth>(),
      firebaseFirestore: _getIt<FirebaseFirestore>(),
    ),
  );
}

Future<void> _registerRepositories() async {
  _getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteAuthDataSource: _getIt(),
    ),
  );
}

Future<void> _registerBlocs() async {
  _getIt
    ..registerFactory(
      () => LogInBloc(
        authRepository: _getIt(),
      ),
    )
    ..registerFactory(
      () => SignUpBloc(
        authRepository: _getIt(),
      ),
    )
    ..registerFactory(
      ResetPasswordBloc.new,
    );
}
