import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/features/auth/widgets/title.dart';
import '../../../repositories/models/users/user.dart';
import '../../../theme/style_for_text.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/button_for_auth_screen.dart';
import '../widgets/data_field.dart';
import '../widgets/pass_field.dart';

part 'sign_up_screen.dart';

part 'pass_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'sign_in_screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  late final FocusNode _passFocusNode;

  late final _authBloc;

  late final _emailController;
  late final _passController;

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    UserSignIn user = UserSignIn(
        login: _emailController.text, password: _passController.text);

    _authBloc.add(AuthSignInEvent(
      user: user,
    ));
  }

  void _navigateSignUp(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pushNamed(SignUpScreen.id);
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _authBloc = context.read<AuthBloc>();
    _passFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passFocusNode.dispose();
    _emailController.dispose();
    _passController.dispose();
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

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
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: TitleForApp(
                        theme: theme.titleMedium!,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    //e-mail
                    DataField(
                      controller: _emailController,
                      theme: theme,
                      focusNode: _passFocusNode,
                      error: 'Укажите E-mail',
                      name: 'E-mail',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //password
                    PassField(
                      controller: _passController,
                      focusNode: _passFocusNode,
                      theme: theme,
                      error: 'Введите пароль',
                      name: 'Пароль',
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
                        ButtonForAuthScreen(
                          name: 'Войти',
                          theme: theme.labelMedium!,
                          color: Colors.white,
                          voidCallback: () {
                            _submit(context);
                          },
                          type: true,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ButtonForAuthScreen(
                          name: 'Войти с помощью google',
                          theme: styleForButtonAuth,
                          color: Colors.transparent,
                          voidCallback: () {},
                          type: false,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'или',
                        style: theme.labelSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ButtonForAuthScreen(
                      name: 'Зарегистрироваться',
                      theme: styleForButtonAuth,
                      color: Colors.transparent,
                      voidCallback: () {
                        _navigateSignUp(context);
                      },
                      type: false,
                    )
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
