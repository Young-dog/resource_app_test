import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../../presentation/presentation.dart';

final _getIt = GetIt.instance;

Future<void> registerDependencies() async {
  await _registerRepositories();
  await _registerBlocs();
  await _registerServices();
}

Future<void> _registerServices() async {
  _getIt
    ..registerLazySingleton<SnackBarService>(SnackBarService.new)
    ..registerLazySingleton<Talker>(TalkerFlutter.init);
}

Future<void> _registerRepositories() async {
  _getIt.registerLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
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
