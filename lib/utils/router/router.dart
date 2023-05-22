import 'package:resourse_app/features/home_page/view/home_page.dart';
import '../../features/auth/view/sign_in_screen.dart';

final router = {
  SignInScreen.id: (context) => const SignInScreen(),
  SignUpScreen.id: (context) => const SignUpScreen(),
  PassScreen.id: (context) => const PassScreen(),
  HomePage.id: (context) => const HomePage(),
};