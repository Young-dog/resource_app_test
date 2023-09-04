import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../presentation/presentation.dart';
import 'guards/guards.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/home',
          page: HomeRoute.page,
          initial: true,
          guards: [AuthGuard()],
          children: [
            AutoRoute(
              path: 'tasker',
              page: TaskerRoute.page,
            ),
            AutoRoute(
              path: 'calendar',
              page: CalendarRoute.page,
            ),
            AutoRoute(
              path: 'chats',
              page: ChatsRoute.page,
            ),
            AutoRoute(
              path: 'settings',
              page: SettingsRoute.page,
            ),
          ],
        ),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: ReVerificationRoute.page),
      ];
}
