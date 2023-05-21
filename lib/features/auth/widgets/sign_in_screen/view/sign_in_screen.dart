import 'package:flutter/material.dart';
import 'package:resourse_app/features/auth/widgets/sign_up_screen/sign_up.dart';

import '../../../../../repositories/models/users/user.dart';
import '../../../bloc/auth_bloc.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'sign_in_screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  late final FocusNode _passFocusNode;

  final _authBloc = AuthBloc();

  String? _email;
  String? _pass;

  @override
  void initState() {
    _passFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passFocusNode.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if(!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    UserSignIn user = UserSignIn(login: _email!, password: _pass!);

    _authBloc.add(AuthSignInEvent( user: user,));
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
        body: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Text(
                        'Resourse',
                        style: theme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    //e-mail
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
                          labelText: "Телефон или e-mail",
                        ),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_passFocusNode);
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Укажите телефон или e-mail';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    //password
                    SizedBox(
                      height: 40,
                      child: TextFormField(
                        focusNode: _passFocusNode,
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
                          //TODO:- submit
                        },
                        onSaved: (value) {
                          _pass = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Введите пароль';
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'забыли пароль?',
                          style: theme.labelSmall,
                        ),
                      ),
                    ),
                    //Вход
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Вход
                        SizedBox(
                          width: wh * 0.3,
                          child: ElevatedButton(
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
                              'Войти',
                              style: theme.labelMedium,
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.transparent),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Войти с помощью google',
                            style:  TextStyle(
                                fontFamily: "Ysabeau",
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'или',
                        style: theme.labelSmall,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignUpScreen.id);
                      },
                      child: const Text(
                        'Зарегистрироваться',
                        style:  TextStyle(
                            fontFamily: "Ysabeau",
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
