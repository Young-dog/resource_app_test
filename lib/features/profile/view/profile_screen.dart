import 'package:flutter/material.dart';
import 'package:resourse_app/features/profile/widget/followers_buttons.dart';
import '../../../theme/style_for_text.dart';
import '../../auth/widgets/button_for_auth_screen.dart';
import '../widget/descriptions_for_profile.dart';
import '../widget/save_histories.dart';
import '../widget/user_image.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'profile_screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme
        .of(context)
        .textTheme;
    double wh = MediaQuery
        .of(context)
        .size
        .width;
    double hh = MediaQuery
        .of(context)
        .size
        .height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('username'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_balance_wallet),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: wh * 0.04, vertical: hh * 0.02),
          child: ListView(
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  UserImage(),
                  FollowersButtons(),
                ],
              ),
              const SizedBox(height: 15,),
              const DescriptionsForProfile(),
              const SizedBox(height: 15,),
              const Align(alignment: Alignment.centerLeft, child: SaveHistories(),),
              const SizedBox(height: 15,),
              ButtonForAuthScreen(
                name: 'Добавить пост',
                theme: styleForButtonAuth,
                type: false,
                color: Colors.transparent,
                voidCallback: () {},
              ),
              const SizedBox(height: 15,),
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
      ),
    );
  }
}
