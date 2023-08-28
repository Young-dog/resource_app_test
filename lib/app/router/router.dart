import 'package:auto_route/auto_route.dart';

import '../../presentation/presentation.dart';
import '../../presentation/ui/location/home_location/main_screen/view/ main_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SignInRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: MainRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: ReVerificationRoute.page),
      ];
}
