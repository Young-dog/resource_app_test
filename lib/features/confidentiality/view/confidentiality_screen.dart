import 'package:flutter/material.dart';

import '../../../repositories/models/users/user.dart';
import '../../../repositories/user/user_repositories.dart';
import '../../../theme/style_for_text.dart';
import '../widget/check_box_cf.dart';

class ConfidentialityScreen extends StatefulWidget {
  static const String id = 'confidentiality_screen';

  const ConfidentialityScreen({super.key});

  @override
  State<ConfidentialityScreen> createState() => _ConfidentialityScreenState();
}

class _ConfidentialityScreenState extends State<ConfidentialityScreen> {
  late bool phoneConf ;
  late bool mailConf;
  late bool dataConf;

  UserAccount? _user;

  Future<void> _loadUser() async {
    _user = await UserRepositories().getUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Конфиденциальность'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            CheckBoxCF(name: 'Телефон', valueConf: phoneConf,),
            CheckBoxCF(name: 'E-mail', valueConf: mailConf,),
            CheckBoxCF(name: 'О себе', valueConf: dataConf,),
          ],
        ),
      ),
    );
  }
}
