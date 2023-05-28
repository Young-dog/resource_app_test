part of 'sign_in_screen.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  static const String id = 'sign_up_screen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  late final FocusNode _usernameFocusNode;

  late final _emailController;
  late final _usernameController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _usernameController = TextEditingController();
    _usernameFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _usernameFocusNode.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      //Invalid
      return;
    }

    _formKey.currentState!.save();

    Map<String, String> userData = {
      'login': _emailController.text,
      'username': _usernameController.text
    };

    Navigator.of(context).pushNamed(PassScreen.id, arguments: userData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TitleForApp(
            theme: theme.titleSmall!,
          ),
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  //e-mail
                  DataField(
                    controller: _emailController,
                    theme: theme,
                    focusNode: _usernameFocusNode,
                    error: 'Укажите e-mail',
                    name: 'E-mail',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //username
                  DataField(
                    controller: _usernameController,
                    theme: theme,
                    focusNode: _usernameFocusNode,
                    error: 'Введите отображаемое имя',
                    name: 'Отображаемое имя',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //Регистриция
                  ButtonForAuthScreen(
                    name: 'Продолжить',
                    theme: theme.labelMedium!,
                    type: false,
                    color: Colors.white,
                    voidCallback: () {
                      _submit(context);
                    },
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
                    name: 'Зарегистрироваться с помощью google',
                    theme: styleForButtonAuth,
                    type: false,
                    color: Colors.transparent,
                    voidCallback: () {},
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
