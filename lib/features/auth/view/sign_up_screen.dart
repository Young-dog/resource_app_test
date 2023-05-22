import 'package:flutter/material.dart';
import 'package:resourse_app/features/auth/view/pass_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'sign_up_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  late final FocusNode _usernameFocusNode;

  String? _email;
  String? _username;

  @override
  void initState() {
    _usernameFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if(!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    Map<String, String> userData = {'login' : _email!, 'username' : _username!};

    Navigator.of(context).pushNamed(PassScreen.id,arguments: userData);

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
                        FocusScope.of(context).requestFocus(_usernameFocusNode);
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
                  //username
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      focusNode: _usernameFocusNode,
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
                        labelText: "Отображаемое имя",
                      ),
                      onFieldSubmitted: (_) {
                        //TODO: -submit
                      },
                      onSaved: (value) {
                        _username = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Введите отображаемое имя';
                        }
                        if (value.length < 3) {
                          return 'Слишком короткое имя';
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
                      'Продолжить',
                      style: theme.labelMedium,
                    ),
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
                    onPressed: () {},
                    child: const Text(
                      'Зарегистрироваться с помощью google',
                      style:  TextStyle(
                          fontFamily: "Ysabeau",
                          fontSize: 15,
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
    );
  }
}
