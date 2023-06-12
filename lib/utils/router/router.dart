import 'package:resourse_app/features/edit_profile/view/edit_profile_screen.dart';
import 'package:resourse_app/features/home_page/view/home_page.dart';
import 'package:resourse_app/features/profile/view/view.dart';
import 'package:resourse_app/features/wallet/view/wallet_screen.dart';
import '../../features/auth/view/sign_in_screen.dart';
import '../../features/confidentiality/view/confidentiality_screen.dart';
import '../../features/reels/view/view.dart';

final router = {
  SignInScreen.id: (context) => const SignInScreen(),
  SignUpScreen.id: (context) => const SignUpScreen(),
  PassScreen.id: (context) => const PassScreen(),
  HomePage.id: (context) => const HomePage(),
  ProfileScreen.id: (context) => const ProfileScreen(),
  ReelsScreen.id: (context) => const ReelsScreen(),
  WalletScreen.id: (context) => const WalletScreen(),
  EditProfileScreen.id: (context) => const EditProfileScreen(),
  ConfidentialityScreen.id: (context) => const ConfidentialityScreen(),
};
