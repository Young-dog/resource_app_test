import 'package:flutter/material.dart';

import '../../../../../repositories/models/users/user.dart';
import '../../../bloc/auth_bloc.dart';

class PassScreen extends StatefulWidget {
  static const String id = 'pass_screen';
  const PassScreen({Key? key}) : super(key: key);

  @override
  State<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends State<PassScreen> {
  final _formKey = GlobalKey<FormState>();

  late final FocusNode _repassFocusNode;

  Map<String, String>? dataUser;

  final _authBloc = AuthBloc();

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if(!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    String? _mail = dataUser!['login'];
    String? _name = dataUser!['username'];

    _formKey.currentState!.save();

    UserSignUp user = UserSignUp(login: _mail!, password: _pass!, username: _name!);

    _authBloc.add(AuthSignUpEvent( user: user,));
  }

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments;
    assert(args != null && args is Map<String, String>, 'The arguments do not match the required type');
    dataUser = args as Map<String, String>;
    super.didChangeDependencies();
  }

  String? _pass;
  String? _repass;

  @override
  void initState() {
    _repassFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _repassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    double wh = MediaQuery.of(context).size.width;
    double hh = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Resourse',
            style: theme.titleSmall,
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  //password
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      style: theme.labelSmall,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1.0),
                        ),
                        labelText: "Пароль",
                      ),
                      obscureText: true,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_repassFocusNode);
                      },
                      onSaved: (value) {
                        _pass = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Введите пароль';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //repass
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      focusNode: _repassFocusNode,
                      style: theme.labelSmall,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 1.0),
                        ),
                        labelText: "Повторите пароль",
                      ),
                      onFieldSubmitted: (_) {
                        //TODO: -submit
                      },
                      onSaved: (value) {
                        _repass = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Введите пароль ещё раз';
                        }
                        if (value != _pass) {
                          return 'Пароли не совпадают';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //Регистриция
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _submit(context);
                    },
                    child: Text(
                      'Зарегистрироваться',
                      style: theme.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
