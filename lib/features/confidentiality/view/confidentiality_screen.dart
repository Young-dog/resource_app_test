import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/features/confidentiality/bloc/confidentiality_bloc.dart';

import '../../../repositories/models/users/user.dart';
import '../../../repositories/user/user_repositories.dart';
import '../widget/check_box_cf.dart';

class ConfidentialityScreen extends StatefulWidget {
  static const String id = 'confidentiality_screen';

  const ConfidentialityScreen({super.key});

  @override
  State<ConfidentialityScreen> createState() => _ConfidentialityScreenState();
}

class _ConfidentialityScreenState extends State<ConfidentialityScreen> {
  late bool phoneConf;
  late bool mailConf;
  late bool dataConf;

  UserAccount? _user;

  Future<void> _loadUser() async {
    _user = await UserRepositories().getUserData();
    setState(() {});
    phoneConf = _user!.phone['conf'];
    dataConf = _user!.description['conf'];
    mailConf = _user!.mail['conf'];
  }

  @override
  void initState() {
    _loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Конфиденциальность'),
          centerTitle: true,
        ),
        body: BlocConsumer<ConfidentialityBloc, ConfidentialityState>(
          listener: (context, state) {
            if (state is ConfidentialityErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.failureException.toString(),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ConfidentialityLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }

            return _user != null ? ListView(
              children: [
                CheckBoxCF(
                  name: 'Телефон',
                  valueConf: phoneConf,
                  data: _user!.phone['number'],
                  sdName: 'number',
                  nameKey: 'phone',
                ),
                CheckBoxCF(
                  name: 'E-mail',
                  valueConf: mailConf,
                  data: _user!.mail['e-mail'],
                  sdName: 'e-mail',
                  nameKey: 'mail',
                ),
                CheckBoxCF(
                  name: 'О себе',
                  valueConf: dataConf,
                  data: _user!.description['data'],
                  sdName: 'data',
                  nameKey: 'description',
                ),
              ],
            ) : const Center(child: CircularProgressIndicator(color: Colors.white,));
          },
        ),
      ),
    );
  }
}
