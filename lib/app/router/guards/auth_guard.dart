import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';

import '../../../core/services/auth_service.dart';
import '../../app.dart';

class AuthGuard extends AutoRouteGuard {

  final _auth = GetIt.instance<AuthService>();


  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    _auth.authStateChanges.listen((bool result) {
      if (result) {
        resolver.next(true);
      } else {
        resolver.redirect(const SignInRoute(), replace: true);
      }
    });
  }
}
