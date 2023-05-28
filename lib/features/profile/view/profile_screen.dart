import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:resourse_app/features/edit_profile/view/edit_profile_screen.dart';
import 'package:resourse_app/features/profile/widget/followers_buttons.dart';
import 'package:resourse_app/features/wallet/view/wallet_screen.dart';
import '../../../theme/style_for_text.dart';
import '../../auth/widgets/button_for_auth_screen.dart';
import '../widget/descriptions_for_profile.dart';
import '../widget/save_histories.dart';
import '../widget/user_image.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    double wh = MediaQuery.of(context).size.width;
    double hh = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('username'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WalletScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.account_balance_wallet),
            ),
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: wh * 0.04, vertical: hh * 0.02),
          child: ListView(
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  UserImage(),
                  FollowersButtons(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const DescriptionsForProfile(),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: SaveHistories(),
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonForAuthScreen(
                name: 'Добавить пост',
                theme: styleForButtonAuth,
                type: false,
                color: Colors.transparent,
                voidCallback: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ButtonForAuthScreen(
                    name: 'Платный контент',
                    theme: styleForButtonAuth,
                    type: false,
                    color: Colors.transparent,
                    voidCallback: () {},
                  ),
                  ButtonForAuthScreen(
                    name: 'Бесплатный контент',
                    theme: styleForButtonAuth,
                    type: false,
                    color: Colors.transparent,
                    voidCallback: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Редактировать профиль',
                  style: theme.bodySmall,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Конфеденциальностть',
                  style: theme.bodySmall,
                ),
                onTap: () {},
              ),
              ListTile(
                title: Text(
                  'Уведомления',
                  style: theme.bodySmall,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
