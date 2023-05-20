import 'package:resourse_app/features/auth/widgets/sign_in_screen/sign_in.dart';
import 'package:resourse_app/features/auth/widgets/sign_up_screen/sign_up.dart';
import 'package:resourse_app/features/auth/widgets/sign_up_screen/widget/pass_screen.dart';

final router = {
  SignInScreen.id: (context) => SignInScreen(),
  SignUpScreen.id: (context) => SignUpScreen(),
  PassScreen.id: (context) => PassScreen(),
};