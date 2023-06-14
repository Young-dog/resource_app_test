// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/features/auth/bloc/auth_bloc.dart';
import 'package:resourse_app/features/profile/widget/side_bar.dart';
import 'package:resourse_app/features/wallet/view/wallet_screen.dart';
import '../../../repositories/models/users/user.dart';
import '../../../repositories/user/user_repositories.dart';
import '../widget/choice_content.dart';
import '../widget/descriptions_for_profile.dart';
import '../widget/user_image.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profile_screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  UserAccount? _user;

  Future<UserAccount> _loadUser() async {
    _user = await UserRepositories().getUserData();
    setState(() {});
    return _user!;
  }

  late final _authBloc;
  late TabController _tabController;

  toggleDrawer() async {
    if (_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    } else {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    _loadUser();
    _authBloc = context.read<AuthBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    double wh = MediaQuery.of(context).size.width;
    double hh = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _user == null
            ? null
            : AppBar(
                title: Text(_user!.uniqueId.replaceAll('@', '').trim(),),
                actions: [
                  //add post
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_sharp),
                  ),
                  //wallet
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WalletScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.account_balance_wallet),
                  ),
                  //menu
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                ],
              ),
        body: _user == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: wh * 0.04, vertical: hh * 0.02),
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  FutureBuilder(
                      future: _loadUser(),
                      builder: (context, snapshot) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            UserImage(
                              imageUrl: snapshot.data?.avatarUrl ?? '',
                            ),
                            SizedBox(
                              width: wh * 0.1,
                            ),
                            DescriptionsForProfile(
                              name: _user!.name,
                              phone: _user!.phone,
                              description: _user!.description,
                              mail: _user!.mail,
                            ),
                          ],
                        );
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  ChoiceContent(
                    controller: _tabController,
                  ),
                ],
              ),
            ),
        endDrawer: SideBar(theme: theme, authBloc: _authBloc),
      ),
    );
  }
}
